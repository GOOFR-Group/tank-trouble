GDPC                                                                               <   res://.import/Tank.png-6b814efe52363d0f402882e8d075539d.stex0      �       ̾��r��7������$   res://Assets/Images/Tank.png.import        �      �t���=���qr���   res://Prefabs/Tank.tscn �            G����=���=��   res://Scenes/MainScene.tscn �      
      ������+�?�m�M�   res://Scripts/Tank.gd.remap �      '       �@���
���e�   res://Scripts/Tank.gdc   	      �      gB/���ك	�[��V�   res://project.binary       0      #�E����bx
@�q�GDST                  �   WEBPRIFF�   WEBPVP8L�   /�/ H�Xl.�l�j���g!ȶ�Ĭ�xA���Xנ��ؤ�\$��!� | O10q�!������+����Os_��to�}��ڦ�4�?�����l[�Ŭ̓2��%UL3S������q��ؤ�'��U���
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
               [gd_scene load_steps=4 format=2]

[ext_resource path="res://Scripts/Tank.gd" type="Script" id=1]
[ext_resource path="res://Assets/Images/Tank.png" type="Texture" id=2]

[sub_resource type="RectangleShape2D" id=1]
extents = Vector2( 16, 16 )

[node name="Tank" type="KinematicBody2D"]
physics_interpolation_mode = 2
script = ExtResource( 1 )

[node name="Collision" type="CollisionShape2D" parent="."]
visible = false
shape = SubResource( 1 )

[node name="Sprite" type="Sprite" parent="."]
texture = ExtResource( 2 )
            [gd_scene load_steps=2 format=2]

[ext_resource path="res://Prefabs/Tank.tscn" type="PackedScene" id=1]

[node name="MainScene" type="Node2D"]

[node name="Camera2D" type="Camera2D" parent="."]
current = true

[node name="Tank" parent="." instance=ExtResource( 1 )]
      GDSC      	   &   �      ������������τ�   ����Ҷ��   �������������Ҷ�   ����������϶   ������������������϶   �������Ŷ���   ����׶��   ����¶��   ����������������Ҷ��   ���������������Ŷ���   �����Ӷ�   ���������������ض���   ��������۶��   �����������ض���   �������������Ķ�   �涶   ������Ҷ   ���������������Ӷ���   �                      shoot         Shoot         rotate_left       rotate_right      move_forward      move_backwards                                                      	      
          '      (      1      2      ?      @      A      N      S      W      X      a      b      k      v            �      �      �      �      �       �   !   �   "   �   #   �   $   �   %   �   &   3YYY8;�  V�  YYY8;�  V�  YYY8;�  V�  �  Y;�  V�  �  YY0�  P�  V�  QV�  �  �  �5  P�  �  R�  R�  Q�  �  �  &�  T�  P�  Q�  �  V�  �?  P�  Q�  �  �  YY0�	  P�  V�  QV�  �  &�  T�  P�  QV�  �
  P�+  P�  Q�  Q�  &�  T�  P�  QV�  �
  P�+  P�  Q�  Q�  �  �  ;�  V�  T�  PQ�  ;�  V�  T�  T�  P�  Q�  �  �  &�  T�  P�  QV�  �  P�  �  �  Q�  &�  T�  P�  QV�  �  P�  �  �  QY`          [remap]

path="res://Scripts/Tank.gdc"
         ECFG      application/config/name         tank-trouble   application/run/main_scene$         res://Scenes/MainScene.tscn    display/window/stretch/mode         2d     display/window/stretch/aspect         keep+   gui/common/drop_mouse_on_gui_input_disabled            importer_defaults/texture�              compress/bptc_ldr                compress/hdr_mode                compress/lossy_quality    ffffff�?      compress/mode                compress/normal_map           	   detect_3d               flags/anisotropic                flags/filter             flags/mipmaps                flags/repeat          
   flags/srgb              process/HDR_as_SRGB              process/fix_alpha_border            process/invert_color             process/normal_map_invert_y              process/premult_alpha             
   size_limit               stream            	   svg/scale        �?   input/move_forward�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode        physical_scancode             unicode           echo          script         input/move_backwards�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode        physical_scancode             unicode           echo          script         input/rotate_left�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode        physical_scancode             unicode           echo          script         input/rotate_right�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode        physical_scancode             unicode           echo          script         input/shoot�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode          physical_scancode             unicode           echo          script         mono/project/assembly_name         tank-trouble)   physics/common/enable_pause_aware_picking         