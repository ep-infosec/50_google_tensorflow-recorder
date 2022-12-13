# Lint as: python3

# Copyright 2020 Google LLC.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

"""Miscellaneous utility functions."""

from datetime import datetime
from typing import Dict

import csv
import os

import tensorflow as tf

from tfrecorder import beam_image
from tfrecorder import constants
from tfrecorder import dataset_loader

_OUT_IMAGE_TEMPLATE = 'image_{:0>3d}.png'


def _stringify(scalar: tf.Tensor) -> str:
  """Converts scalar tensor into a Python string."""

  val = scalar.numpy()
  return val.decode('utf-8') if isinstance(val, bytes) else str(val)


def _save_image_from_record(record: Dict[str, tf.Tensor], outfile: str):
  """Extracts image data from parsed TFRecord and saves it to a file."""

  b64_image = record['image'].numpy()
  image = beam_image.decode(
      b64_image,
      record['image_width'], record['image_height'], record['image_channels'])
  image.save(outfile)


def inspect(
    tfrecord_dir: str,
    split: str = 'TRAIN',
    num_records: int = 1,
    output_dir: str = 'output'):
  """Prints contents of TFRecord files generated by TFRecorder.

  Args:
    tfrecord_dir: TFRecord directory.
    split: Dataset split (see `schema.allowed_split_values`).
    num_records: Number of records to output.
    output_dir: Directory to dump read records.

  Raises:
    `ValueError` when data for a given `split` could not be loaded.
  """

  dataset = dataset_loader.load(tfrecord_dir).get(split)
  if not dataset:
    raise ValueError(f'Could not load data for {split}')

  data_dir = os.path.join(
      output_dir, 'check-tfrecords-' + get_timestamp())
  os.makedirs(data_dir)

  with open(os.path.join(data_dir, 'data.csv'), 'wt') as f:
    writer = csv.writer(f)

    # Write CSV header
    for data in dataset.take(1).as_numpy_iterator():
      # .as_numpy_iterator() converts from Tuple of Tensors to a dict.
      # list() yields the keys of that dict.
      #TODO(mikebernico): Check the schema type instead of image key name.
      header = [k for k in list(data) if k != 'image']
      writer.writerow(header)

    for r in dataset.take(num_records):
      # Save non-image bytes data to CSV.
      # This will save image metadata as well.
      row = [_stringify(r[k]) for k in header]
      writer.writerow(row)

      # Save image data to a file
      if 'image_name' in r:
        _, image_filename = os.path.split(_stringify(r['image_name']))
        image_path = os.path.join(data_dir, image_filename)
        _save_image_from_record(r, image_path)

    print('Output written to {}'.format(data_dir))

    return data_dir


def get_timestamp() -> str:
  """Returns current date and time as formatted string."""
  return datetime.now().strftime('%Y%m%d-%H%M%S')


def copy_logfile_to_gcs(logfile: str, output_dir: str):
  """Copies a logfile from local to gcs storage."""
  try:
    with open(logfile, 'r') as log_reader:
      out_log = os.path.join(output_dir, constants.LOGFILE)
      with tf.io.gfile.GFile(out_log, 'w') as gcs_logfile:
        log = log_reader.read()
        gcs_logfile.write(log)
  except FileNotFoundError as e:
    raise FileNotFoundError("Unable to copy log file {} to gcs.".format(
        e.filename)) from e
