GDPC                                                                               <   res://.import/Tank.png-6b814efe52363d0f402882e8d075539d.stex�      �       ̾��r��7������$   res://Assets/Images/Tank.png.import �      �      �t���=���qr���$   res://Prefabs/Tanks/Player1Tank.tscn�      R      8�aߋS*u0\��"$   res://Prefabs/Tanks/Player2Tank.tscn�	            �k�'�l�Ä�UH2c    res://Prefabs/Tanks/Tank.tscn   p      T      (�%ø�l=���(   res://Scenes/MainScene.tscn �      �      �ke�2�5%����4$   res://Scripts/Player1Tank.gd.remap  p      .       �8pSx��kF]&� �    res://Scripts/Player1Tank.gdc   �      �      �h�cj�Y�.l�iB�$   res://Scripts/Player2Tank.gd.remap  �      .       ������K�E}L\d    res://Scripts/Player2Tank.gdc   0      �      w	����A ;�u%�G�   res://Scripts/Tank.gd.remap �      '       �@���
���e�   res://Scripts/Tank.gdc  �      �      �6��I���^�b)�؏   res://project.binary       J      ��y	�k��1��ì�GDST                  �   WEBPRIFF�   WEBPVP8L�   /�/ H�Xl.�l�j���g!ȶ�Ĭ�xA���Xנ��ؤ�\$��!� | O10q�!������+����Os_��to�}��ڦ�4�?�����l[�Ŭ̓2��%UL3S������q��ؤ�'��U���
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
[ext_resource path="res://Scripts/Player1Tank.gd" type="Script" id=2]
[ext_resource path="res://Assets/Images/Tank.png" type="Texture" id=3]

[sub_resource type="RectangleShape2D" id=1]
extents = Vector2( 11.5, 16 )

[node name="Player1Tank" instance=ExtResource( 1 )]
script = ExtResource( 2 )

[node name="Sprite" parent="." index="0"]
rotation = 1.5708
texture = ExtResource( 3 )

[node name="Collision" parent="." index="1"]
position = Vector2( -4.5, 0 )
shape = SubResource( 1 )
              [gd_scene load_steps=5 format=2]

[ext_resource path="res://Prefabs/Tanks/Tank.tscn" type="PackedScene" id=1]
[ext_resource path="res://Assets/Images/Tank.png" type="Texture" id=2]
[ext_resource path="res://Scripts/Player2Tank.gd" type="Script" id=3]

[sub_resource type="RectangleShape2D" id=1]
extents = Vector2( 11.5, 16 )

[node name="Player2Tank" instance=ExtResource( 1 )]
script = ExtResource( 3 )

[node name="Sprite" parent="." index="0"]
modulate = Color( 0, 0.984314, 0.360784, 1 )
rotation = 1.5708
texture = ExtResource( 2 )

[node name="Collision" parent="." index="1"]
position = Vector2( -4.5, 0 )
shape = SubResource( 1 )
 [gd_scene load_steps=2 format=2]

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

[node name="Player2Tank" parent="." instance=ExtResource( 2 )]
position = Vector2( 43, 46 )
     GDSC            e      ������������Ӷ��   �����������������ض�   ����¶��   ����������������Ҷ��   ����������Ӷ   �������϶���   ��������   ����Ҷ��      res://Scripts/Tank.gd                p1_rotate_left              p1_rotate_right       p1_move_forward       p1_move_backwards                                                    &      *   	   -   
   .      6      <      E      N      W      c      3YY0PQX�  V�  ;�  �  �  &�  T�  P�  QV�  �  �  �  &�  T�  P�  QV�  �  �  �  .�  YY0�  PQX=V�  �  �  T�  �  &�  T�  P�  QV�  �  �  P�  R�  Q�  &�  T�  P�  QV�  �  �  P�  �  R�  QY`   GDSC            e      ������������Ӷ��   �����������������ض�   ����¶��   ����������������Ҷ��   ����������Ӷ   �������϶���   ��������   ����Ҷ��      res://Scripts/Tank.gd                p2_rotate_left              p2_rotate_right       p2_move_forward       p2_move_backwards                                                    &      *   	   -   
   .      6      <      E      N      W      c      3YY0PQX�  V�  ;�  �  �  &�  T�  P�  QV�  �  �  �  &�  T�  P�  QV�  �  �  �  .�  YY0�  PQX=V�  �  �  T�  �  &�  T�  P�  QV�  �  �  P�  R�  Q�  &�  T�  P�  QV�  �  �  P�  �  R�  QY`   GDSC         -   �      ������������τ�   ����Ҷ��   �������������Ҷ�   ����������϶   ������������������϶   �������϶���   ��������   �������Ŷ���   ����׶��   ����¶��   ����������������Ҷ��   ���������������Ŷ���   �����������������ض�   ������������Ӷ��   �������ض���   ����������Ӷ   ������Ҷ   �������������Ӷ�   �        �?                   p1_shoot      Shoot                                                              	      
          '      (      )      2      3      <      =      J      K      L      Y      ^      b      c      l      m      t      |      }      ~      �       �   !   �   "   �   #   �   $   �   %   �   &   �   '   �   (   �   )   �   *   �   +   �   ,   �   -   3YYY8;�  V�  YYY8;�  V�  �  YYY8;�  V�  �  Y;�  V�  �  YYY;�  V�  �  T�  YY0�  P�  V�  QV�  �  �  �5  P�  �  R�  R�  Q�  �  �  &�	  T�
  P�  Q�  �  V�  �?  P�  Q�  �  �  YY0�  P�  V�  QV�  �  ;�  �  PQ�  �  �  �  �  �  �  �  �  PQ�  �  �  T�  P�  Q�  �  �  P�  Q�  -YYYY0�  PQX�  V�  .�  YYYY0�  PQX=V�  -Y`   [remap]

path="res://Scripts/Player1Tank.gdc"
  [remap]

path="res://Scripts/Player2Tank.gdc"
  [remap]

path="res://Scripts/Tank.gdc"
         ECFG      application/config/name         tank-trouble   application/run/main_scene$         res://Scenes/MainScene.tscn    display/window/stretch/mode         2d     display/window/stretch/aspect         keep+   gui/common/drop_mouse_on_gui_input_disabled            importer_defaults/texture�              compress/bptc_ldr                compress/hdr_mode                compress/lossy_quality    ffffff�?      compress/mode                compress/normal_map           	   detect_3d               flags/anisotropic                flags/filter             flags/mipmaps                flags/repeat          
   flags/srgb              process/HDR_as_SRGB              process/fix_alpha_border            process/invert_color             process/normal_map_invert_y              process/premult_alpha             
   size_limit               stream            	   svg/scale        �?   input/p1_move_forward�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode        physical_scancode             unicode           echo          script         input/p1_move_backwards�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode        physical_scancode             unicode           echo          script         input/p1_rotate_left�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode        physical_scancode             unicode           echo          script         input/p1_rotate_right�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode        physical_scancode             unicode           echo          script         input/p1_shoot�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode          physical_scancode             unicode           echo          script         input/p2_move_forward�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode   W      physical_scancode             unicode           echo          script         input/p2_move_backwards�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode   S      physical_scancode             unicode           echo          script         input/p2_rotate_left�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode   A      physical_scancode             unicode           echo          script         input/p2_rotate_right�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode   D      physical_scancode             unicode           echo          script         input/p2_shoot�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode   Q      physical_scancode             unicode           echo          script         mono/project/assembly_name         tank-trouble)   physics/common/enable_pause_aware_picking               