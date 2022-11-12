GDPC                                                                               <   res://.import/Tank.png-6b814efe52363d0f402882e8d075539d.stexP      �       ̾��r��7������$   res://Assets/Images/Tank.png.import @      �      �t���=���qr���$   res://Prefabs/Tanks/Player1Tank.tscn       �      Q�	�����ì=O$   res://Prefabs/Tanks/Player2Tank.tscn�	            5!��xے���4k��'    res://Prefabs/Tanks/Tank.tscn   �      T      (�%ø�l=���(   res://Scenes/MainScene.tscn P            �� �Yq9��Οm$   res://Scripts/PlayerTank.gd.remap   �      -       �/��}�2��*D꒶�   res://Scripts/PlayerTank.gdc`      �      J�o���;��aa���   res://Scripts/Tank.gd.remap �      '       �@���
���e�   res://Scripts/Tank.gdc  @      v      o!@�G����V�]"]&   res://project.binary       J      ��y	�k��1��ì�GDST                  �   WEBPRIFF�   WEBPVP8L�   /�/ H�Xl.�l�j���g!ȶ�Ĭ�xA���Xנ��ؤ�\$��!� | O10q�!������+����Os_��to�}��ڦ�4�?�����l[�Ŭ̓2��%UL3S������q��ؤ�'��U���
B��H�H� %�C�w�o�ೆ�j?tP �q�2ч      [remap]

importer="texture"
type="StreamTexture"
path="res://.import/Tank.png-6b814efe52363d0f402882e8d075539d.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://Assets/Images/Tank.png"
dest_files=[ "res://.import/Tank.png-6b814efe52363d0f402882e8d075539d.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=false
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
process/normal_map_invert_y=false
stream=false
size_limit=0
detect_3d=true
svg/scale=1.0
               [gd_scene load_steps=5 format=2]

[ext_resource path="res://Prefabs/Tanks/Tank.tscn" type="PackedScene" id=1]
[ext_resource path="res://Scripts/PlayerTank.gd" type="Script" id=2]
[ext_resource path="res://Assets/Images/Tank.png" type="Texture" id=3]

[sub_resource type="RectangleShape2D" id=1]
extents = Vector2( 16, 11.5 )

[node name="Player1Tank" instance=ExtResource( 1 )]
script = ExtResource( 2 )
rotate_left_input = "p1_rotate_left"
rotate_righ_input = "p1_rotate_right"
move_backward_input = "p1_move_backwards"
move_forward_input = "p1_move_forward"

[node name="Sprite" parent="." index="0"]
texture = ExtResource( 3 )

[node name="Collision" parent="." index="1"]
position = Vector2( 0, 4.5 )
shape = SubResource( 1 )
      [gd_scene load_steps=5 format=2]

[ext_resource path="res://Prefabs/Tanks/Tank.tscn" type="PackedScene" id=1]
[ext_resource path="res://Assets/Images/Tank.png" type="Texture" id=2]
[ext_resource path="res://Scripts/PlayerTank.gd" type="Script" id=3]

[sub_resource type="RectangleShape2D" id=1]
extents = Vector2( 16, 11.5 )

[node name="Player2Tank" instance=ExtResource( 1 )]
script = ExtResource( 3 )
rotate_left_input = "p2_rotate_left"
rotate_righ_input = "p2_rotate_right"
move_backward_input = "p2_move_backwards"
move_forward_input = "p2_move_forward"

[node name="Sprite" parent="." index="0"]
modulate = Color( 0, 0.984314, 0.360784, 1 )
texture = ExtResource( 2 )

[node name="Collision" parent="." index="1"]
position = Vector2( 0, 4.5 )
shape = SubResource( 1 )
         [gd_scene load_steps=2 format=2]

[ext_resource path="res://Scripts/Tank.gd" type="Script" id=1]

[node name="Tank" type="KinematicBody2D"]
physics_interpolation_mode = 2
script = ExtResource( 1 )
__meta__ = {
"_edit_group_": true
}

[node name="Sprite" type="Sprite" parent="."]

[node name="Collision" type="CollisionShape2D" parent="."]
            [gd_scene load_steps=3 format=2]

[ext_resource path="res://Prefabs/Tanks/Player1Tank.tscn" type="PackedScene" id=1]
[ext_resource path="res://Prefabs/Tanks/Player2Tank.tscn" type="PackedScene" id=2]

[node name="MainScene" type="Node2D"]

[node name="Player1Tank" parent="." instance=ExtResource( 1 )]
position = Vector2( 961, 543 )
rotation = -1.5708
speed = 200
rotation_speed = 1

[node name="Player2Tank" parent="." instance=ExtResource( 2 )]
position = Vector2( 43, 46 )
rotation = 1.5708
speed = 200
rotation_speed = 1
  GDSC   
         s      ����������������¶��   ����������������¶��   ������������������¶   �����������������¶�   ������������Ӷ��   �����������������ض�   ����¶��   ����������������Ҷ��   ����������Ӷ   �������������ض�      res://Scripts/Tank.gd                                   	                              $   	   )   
   2      6      ?      C      F      G      O      T      ]      a      j      n      q      3YY8;V�  Y8;�  V�  Y8;�  V�  Y8;�  V�  YY0�  PQX�  V�  ;�  �  �  &�  T�  PQV�  �  �  �  &�  T�  P�  QV�  �  �  �  .�  YY0�  PQX�  V�  ;�	  �  �  &�  T�  P�  QV�  �	  �  �  &�  T�  P�  QV�  �	  �  �  .�	  Y`         GDSC         )   �      ������������τ�   ����Ҷ��   �������������Ҷ�   ����������϶   ������������������϶   �������Ŷ���   ����׶��   ����¶��   ����������������Ҷ��   ���������������Ŷ���   �����������������ض�   ������������Ӷ��   �������ض���   �������������Ķ�   �涶   ������Ҷ   �������������ض�   ����������Ӷ   �������������Ӷ�   �        �?                   p1_shoot      Shoot                                                       	      
          '      (      1      2      ?      @      A      N      S      W      X      a      b      i      q      r      s      �      �      �      �       �   !   �   "   �   #   �   $   �   %   �   &   �   '   �   (   �   )   3YYY8;�  V�  YYY8;�  V�  �  YYY8;�  V�  �  Y;�  V�  �  YY0�  P�  V�  QV�  �  �  �5  P�  �  R�  R�  Q�  �  �  &�  T�  P�  Q�  �  V�  �?  P�  Q�  �  �  YY0�	  P�  V�  QV�  �  ;�
  �  PQ�  �  �
  �  �  �  �  �  ;�  V�  T�  T�  P�  Q�  ;�  �  PQ�  �  P�  �  �  QYYYY0�  PQX�  V�  .�  YYYY0�  PQX�  V�  .�  Y`          [remap]

path="res://Scripts/PlayerTank.gdc"
   [remap]

path="res://Scripts/Tank.gdc"
         ECFG      application/config/name         tank-trouble   application/run/main_scene$         res://Scenes/MainScene.tscn    display/window/stretch/mode         2d     display/window/stretch/aspect         keep+   gui/common/drop_mouse_on_gui_input_disabled            importer_defaults/texture�              compress/bptc_ldr                compress/hdr_mode                compress/lossy_quality    ffffff�?      compress/mode                compress/normal_map           	   detect_3d               flags/anisotropic                flags/filter             flags/mipmaps                flags/repeat          
   flags/srgb              process/HDR_as_SRGB              process/fix_alpha_border            process/invert_color             process/normal_map_invert_y              process/premult_alpha             
   size_limit               stream            	   svg/scale        �?   input/p1_move_forward�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode        physical_scancode             unicode           echo          script         input/p1_move_backwards�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode        physical_scancode             unicode           echo          script         input/p1_rotate_left�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode        physical_scancode             unicode           echo          script         input/p1_rotate_right�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode        physical_scancode             unicode           echo          script         input/p1_shoot�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode          physical_scancode             unicode           echo          script         input/p2_move_forward�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode   W      physical_scancode             unicode           echo          script         input/p2_move_backwards�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode   S      physical_scancode             unicode           echo          script         input/p2_rotate_left�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode   A      physical_scancode             unicode           echo          script         input/p2_rotate_right�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode   D      physical_scancode             unicode           echo          script         input/p2_shoot�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode   Q      physical_scancode             unicode           echo          script         mono/project/assembly_name         tank-trouble)   physics/common/enable_pause_aware_picking               