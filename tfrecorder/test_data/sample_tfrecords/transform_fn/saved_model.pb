?>
??
8
Const
output"dtype"
valuetensor"
dtypetype
?
HashTableV2
table_handle"
	containerstring "
shared_namestring "!
use_node_name_sharingbool( "
	key_dtypetype"
value_dtypetype?
.
Identity

input"T
output"T"	
Ttype
?
InitializeTableFromTextFileV2
table_handle
filename"
	key_indexint(0?????????"
value_indexint(0?????????"+

vocab_sizeint?????????(0?????????"
	delimiterstring	?
w
LookupTableFindV2
table_handle
keys"Tin
default_value"Tout
values"Tout"
Tintype"
Touttype?
2
LookupTableSizeV2
table_handle
size	?
8
Maximum
x"T
y"T
z"T"
Ttype:

2	
8
Minimum
x"T
y"T
z"T"
Ttype:

2	

NoOp
C
Placeholder
output"dtype"
dtypetype"
shapeshape:
[
Reshape
tensor"T
shape"Tshape
output"T"	
Ttype"
Tshapetype0:
2	
:
Sub
x"T
y"T
z"T"
Ttype:
2	"	transform*2.2.02v2.2.0-rc4-8-g2b96f3662b?)
G
ConstConst*
_output_shapes
: *
dtype0	*
value	B	 R
?
Const_1Const*
_output_shapes
: *
dtype0*?
value?B? B?tfrecorder/test_data/output/tfrecorder-20200804-183148-create-tfrecords/tft_tmp/tftransform_tmp/vocab_compute_and_apply_vocabulary_vocabulary
q
transform/inputs/imagePlaceholder*#
_output_shapes
:?????????*
dtype0*
shape:?????????
|
!transform/inputs/F_image_channelsPlaceholder*#
_output_shapes
:?????????*
dtype0	*
shape:?????????
z
transform/inputs/F_image_heightPlaceholder*#
_output_shapes
:?????????*
dtype0	*
shape:?????????
x
transform/inputs/F_image_namePlaceholder*#
_output_shapes
:?????????*
dtype0*
shape:?????????
y
transform/inputs/F_image_widthPlaceholder*#
_output_shapes
:?????????*
dtype0	*
shape:?????????
q
transform/inputs/labelPlaceholder*#
_output_shapes
:?????????*
dtype0*
shape:?????????
q
transform/inputs/splitPlaceholder*#
_output_shapes
:?????????*
dtype0*
shape:?????????
t
"transform/inputs/inputs/image_copyIdentitytransform/inputs/image*
T0*#
_output_shapes
:?????????
?
-transform/inputs/inputs/F_image_channels_copyIdentity!transform/inputs/F_image_channels*
T0	*#
_output_shapes
:?????????
?
+transform/inputs/inputs/F_image_height_copyIdentitytransform/inputs/F_image_height*
T0	*#
_output_shapes
:?????????
?
)transform/inputs/inputs/F_image_name_copyIdentitytransform/inputs/F_image_name*
T0*#
_output_shapes
:?????????
?
*transform/inputs/inputs/F_image_width_copyIdentitytransform/inputs/F_image_width*
T0	*#
_output_shapes
:?????????
t
"transform/inputs/inputs/label_copyIdentitytransform/inputs/label*
T0*#
_output_shapes
:?????????
t
"transform/inputs/inputs/split_copyIdentitytransform/inputs/split*
T0*#
_output_shapes
:?????????
?
?transform/compute_and_apply_vocabulary/vocabulary/Reshape/shapeConst*
_output_shapes
:*
dtype0*
valueB:
?????????
?
9transform/compute_and_apply_vocabulary/vocabulary/ReshapeReshape"transform/inputs/inputs/label_copy?transform/compute_and_apply_vocabulary/vocabulary/Reshape/shape*
T0*
Tshape0*#
_output_shapes
:?????????
?
stransform/compute_and_apply_vocabulary/vocabulary/vocab_compute_and_apply_vocabulary_vocabulary_unpruned_vocab_sizePlaceholder*
_output_shapes
: *
dtype0	*
shape: 
~
=transform/compute_and_apply_vocabulary/vocabulary/PlaceholderPlaceholder*
_output_shapes
: *
dtype0*
shape: 
?
8transform/compute_and_apply_vocabulary/apply_vocab/ConstConst*
_output_shapes
: *
dtype0	*
valueB	 R
?????????
?
=transform/compute_and_apply_vocabulary/apply_vocab/hash_tableHashTableV2*
_output_shapes
: *
	container *
	key_dtype0*y
shared_namejhhash_table_Tensor("compute_and_apply_vocabulary/vocabulary/Placeholder:0", shape=(), dtype=string)_-2_-1*
use_node_name_sharing( *
value_dtype0	
?
_transform/compute_and_apply_vocabulary/apply_vocab/text_file_init/InitializeTableFromTextFileV2InitializeTableFromTextFileV2=transform/compute_and_apply_vocabulary/apply_vocab/hash_tableConst_1*
	delimiter	*
	key_index?????????*
value_index?????????*

vocab_size?????????
?
Ttransform/compute_and_apply_vocabulary/apply_vocab/hash_table_Size/LookupTableSizeV2LookupTableSizeV2=transform/compute_and_apply_vocabulary/apply_vocab/hash_table*
_output_shapes
: 
?
Vtransform/compute_and_apply_vocabulary/apply_vocab/hash_table_Lookup/LookupTableFindV2LookupTableFindV2=transform/compute_and_apply_vocabulary/apply_vocab/hash_table"transform/inputs/inputs/label_copy8transform/compute_and_apply_vocabulary/apply_vocab/Const*	
Tin0*

Tout0	*#
_output_shapes
:?????????
|
:transform/compute_and_apply_vocabulary/apply_vocab/Const_1Const*
_output_shapes
: *
dtype0	*
value	B	 R 
z
8transform/compute_and_apply_vocabulary/apply_vocab/sub/yConst*
_output_shapes
: *
dtype0	*
value	B	 R
?
6transform/compute_and_apply_vocabulary/apply_vocab/subSubTtransform/compute_and_apply_vocabulary/apply_vocab/hash_table_Size/LookupTableSizeV28transform/compute_and_apply_vocabulary/apply_vocab/sub/y*
T0	*
_output_shapes
: 
?
<transform/compute_and_apply_vocabulary/apply_vocab/Minimum/yConst*
_output_shapes
: *
dtype0	*
valueB	 R
?????????
?
:transform/compute_and_apply_vocabulary/apply_vocab/MinimumMinimum:transform/compute_and_apply_vocabulary/apply_vocab/Const_1<transform/compute_and_apply_vocabulary/apply_vocab/Minimum/y*
T0	*
_output_shapes
: 
?
<transform/compute_and_apply_vocabulary/apply_vocab/Maximum/yConst*
_output_shapes
: *
dtype0	*
valueB	 R
?????????
?
:transform/compute_and_apply_vocabulary/apply_vocab/MaximumMaximum6transform/compute_and_apply_vocabulary/apply_vocab/sub<transform/compute_and_apply_vocabulary/apply_vocab/Maximum/y*
T0	*
_output_shapes
: 

transform/initNoOp

transform/init_1NoOp

initNoOp"?" 
asset_filepaths

	Const_1:0"?
saved_model_assetso*m
k
+type.googleapis.com/tensorflow.AssetFileDef<

	Const_1:0-vocab_compute_and_apply_vocabulary_vocabulary"x
table_initializerc
a
_transform/compute_and_apply_vocabulary/apply_vocab/text_file_init/InitializeTableFromTextFileV2"[
tft_schema_override_max@
>
<transform/compute_and_apply_vocabulary/apply_vocab/Maximum:0"[
tft_schema_override_min@
>
<transform/compute_and_apply_vocabulary/apply_vocab/Minimum:0"z
tft_schema_override_tensor\
Z
Xtransform/compute_and_apply_vocabulary/apply_vocab/hash_table_Lookup/LookupTableFindV2:0*?
transform_signature?
4
image+
transform/inputs/image:0?????????
H
image_channels6
#transform/inputs/F_image_channels:0	?????????
D
image_height4
!transform/inputs/F_image_height:0	?????????
@

image_name2
transform/inputs/F_image_name:0?????????
B
image_width3
 transform/inputs/F_image_width:0	?????????
4
label+
transform/inputs/label:0?????????
4
split+
transform/inputs/split:0?????????@
image7
$transform/inputs/inputs/image_copy:0?????????T
image_channelsB
/transform/inputs/inputs/F_image_channels_copy:0	?????????P
image_height@
-transform/inputs/inputs/F_image_height_copy:0	?????????L

image_name>
+transform/inputs/inputs/F_image_name_copy:0?????????N
image_width?
,transform/inputs/inputs/F_image_width_copy:0	?????????t
labelk
Xtransform/compute_and_apply_vocabulary/apply_vocab/hash_table_Lookup/LookupTableFindV2:0	?????????@
split7
$transform/inputs/inputs/split_copy:0?????????tensorflow/serving/predict