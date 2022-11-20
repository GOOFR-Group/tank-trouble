GDPC                                                                               @   res://.import/Bullet.png-d94f4e785ae2a0e12beccd3380f7348d.stex  �      f       ̔`Z����.q<   res://.import/Tank.png-6b814efe52363d0f402882e8d075539d.stex�      �       ̾��r��7������(   res://Assets/Images/Bullet.png.import          �      ���gN�N����^�$   res://Assets/Images/Tank.png.import �	      �      �t���=���qr���   res://Prefabs/Bullet.tscn   p      �      bP���{a�+K�~���(   res://Prefabs/Particles/Explosion.tscn  0      )      :j�S��X �=�s.�$   res://Prefabs/Tanks/Player1Tank.tscn`      �      ����D4�,��5���.$   res://Prefabs/Tanks/Player2Tank.tscn             r�+��R���$�aN    res://Prefabs/Tanks/Tank.tscn   0      �      &j���!Q����_�   res://Scenes/MainScene.tscn        �      ?�柈��/�	���    res://Scripts/Bullet.gd.remap   @1      )       0L��K���#�ѐ�3�   res://Scripts/Bullet.gdc        �      �Y���T y�0�}�V��    res://Scripts/Explosion.gd.remapp1      ,       �����#��Wt�1<   res://Scripts/Explosion.gdc �#      z      �Uc�7�>�O{�c��L$   res://Scripts/PlayerTank.gd.remap   �1      -       �/��}�2��*D꒶�   res://Scripts/PlayerTank.gdc0%      J      ���qxKQ���w��   res://Scripts/Tank.gd.remap �1      '       �@���
���e�   res://Scripts/Tank.gdc  �(      �      �LÆ2��dq9���   res://project.binary 2      J      ��y	�k��1��ì�GDST                  J   WEBPRIFF>   WEBPVP8L2   /��BA$��3@֐�$d���� C�1��s��{˙<g^          [remap]

importer="texture"
type="StreamTexture"
path="res://.import/Bullet.png-d94f4e785ae2a0e12beccd3380f7348d.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://Assets/Images/Bullet.png"
dest_files=[ "res://.import/Bullet.png-d94f4e785ae2a0e12beccd3380f7348d.stex" ]

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
         GDST                  �   WEBPRIFF�   WEBPVP8L�   /�/ H�Xl.�l�j���g!ȶ�Ĭ�xA���Xנ��ؤ�\$��!� | O10q�!������+����Os_��to�}��ڦ�4�?�����l[�Ŭ̓2��%UL3S������q��ؤ�'��U���
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

[ext_resource path="res://Scripts/Bullet.gd" type="Script" id=1]
[ext_resource path="res://Assets/Images/Bullet.png" type="Texture" id=2]

[sub_resource type="CapsuleShape2D" id=1]
radius = 8.0
height = 16.0

[node name="Bullet" type="KinematicBody2D"]
scale = Vector2( 0.5, 0.5 )
collision_layer = 2
script = ExtResource( 1 )

[node name="Sprite" type="Sprite" parent="."]
texture = ExtResource( 2 )

[node name="Collision" type="CollisionShape2D" parent="."]
shape = SubResource( 1 )

[node name="LifeTimer" type="Timer" parent="."]
wait_time = 5.0
one_shot = true
autostart = true

[connection signal="timeout" from="LifeTimer" to="." method="_on_lifetime_timeout"]
 [gd_scene load_steps=7 format=2]

[ext_resource path="res://Scripts/Explosion.gd" type="Script" id=1]

[sub_resource type="Curve" id=2]
min_value = -360.0
max_value = 360.0
_data = [ Vector2( 0, -7.36365 ), 0.0, -705.186, 0, 0, Vector2( 1, -321.545 ), -33.2884, 0.0, 0, 0 ]

[sub_resource type="CurveTexture" id=3]
curve = SubResource( 2 )

[sub_resource type="Curve" id=4]
_data = [ Vector2( 0, 0.536364 ), 0.0, 2.75528, 0, 0, Vector2( 0.994382, 0.0181818 ), -2.50818, 0.0, 0, 0 ]

[sub_resource type="CurveTexture" id=5]
curve = SubResource( 4 )

[sub_resource type="ParticlesMaterial" id=6]
emission_shape = 1
emission_sphere_radius = 3.0
flag_disable_z = true
spread = 180.0
gravity = Vector3( 0, 0, 0 )
initial_velocity = 50.0
initial_velocity_random = 0.25
orbit_velocity = 0.0
orbit_velocity_random = 0.0
angle_curve = SubResource( 3 )
scale = 3.0
scale_random = 0.5
scale_curve = SubResource( 5 )
color = Color( 0.870588, 0.498039, 0.0627451, 1 )

[node name="Explosion" type="Particles2D"]
amount = 20
lifetime = 0.6
explosiveness = 1.0
visibility_rect = Rect2( -50, -50, 100, 100 )
process_material = SubResource( 6 )
script = ExtResource( 1 )

[node name="LifeTimer" type="Timer" parent="."]
one_shot = true
autostart = true

[connection signal="timeout" from="LifeTimer" to="." method="_on_lifetime_timeout"]
       [gd_scene load_steps=3 format=2]

[ext_resource path="res://Prefabs/Tanks/Tank.tscn" type="PackedScene" id=1]
[ext_resource path="res://Scripts/PlayerTank.gd" type="Script" id=2]

[node name="Player1Tank" instance=ExtResource( 1 )]
script = ExtResource( 2 )
rotate_left_input = "p1_rotate_left"
rotate_righ_input = "p1_rotate_right"
move_backward_input = "p1_move_backwards"
move_forward_input = "p1_move_forward"
shoot_input = "p1_shoot"
         [gd_scene load_steps=3 format=2]

[ext_resource path="res://Prefabs/Tanks/Tank.tscn" type="PackedScene" id=1]
[ext_resource path="res://Scripts/PlayerTank.gd" type="Script" id=3]

[node name="Player2Tank" instance=ExtResource( 1 )]
script = ExtResource( 3 )
rotate_left_input = "p2_rotate_left"
rotate_righ_input = "p2_rotate_right"
move_backward_input = "p2_move_backwards"
move_forward_input = "p2_move_forward"
shoot_input = "p2_shoot"

[node name="Sprite" parent="." index="0"]
modulate = Color( 0, 0.984314, 0.360784, 1 )
 [gd_scene load_steps=4 format=2]

[ext_resource path="res://Scripts/Tank.gd" type="Script" id=1]
[ext_resource path="res://Assets/Images/Tank.png" type="Texture" id=2]

[sub_resource type="RectangleShape2D" id=1]
extents = Vector2( 16, 11.5 )

[node name="Tank" type="KinematicBody2D" groups=["player"]]
physics_interpolation_mode = 2
script = ExtResource( 1 )
__meta__ = {
"_edit_group_": true
}

[node name="Sprite" type="Sprite" parent="." groups=["player"]]
texture = ExtResource( 2 )

[node name="Collision" type="CollisionShape2D" parent="." groups=["player"]]
position = Vector2( 0, 4.5 )
shape = SubResource( 1 )

[node name="BulletSpawnPoint" type="Position2D" parent="."]
position = Vector2( 0, -27 )

[node name="BulletTimer" type="Timer" parent="."]
wait_time = 0.25
one_shot = true
autostart = true

[connection signal="killed" from="." to="." method="_on_killed"]
[connection signal="timeout" from="BulletTimer" to="." method="_on_shoot_timeout"]
               [gd_scene load_steps=4 format=2]

[ext_resource path="res://Prefabs/Tanks/Player1Tank.tscn" type="PackedScene" id=1]
[ext_resource path="res://Prefabs/Tanks/Player2Tank.tscn" type="PackedScene" id=2]

[sub_resource type="RectangleShape2D" id=1]
extents = Vector2( 20, 20 )

[node name="MainScene" type="Node2D"]

[node name="Player1Tank" parent="." instance=ExtResource( 1 )]
position = Vector2( 961, 543 )
rotation = -1.5708
speed = 100.0
rotation_speed = 2.3

[node name="Player2Tank" parent="." instance=ExtResource( 2 )]
position = Vector2( 43, 46 )
rotation = 1.5708
speed = 100.0
rotation_speed = 2.3

[node name="TestWall" type="StaticBody2D" parent="."]
position = Vector2( 530, 145 )
rotation = 0.436332
scale = Vector2( 1, 7 )

[node name="CollisionShape2D" type="CollisionShape2D" parent="TestWall"]
position = Vector2( 20, 20 )
shape = SubResource( 1 )

[node name="ColorRect" type="ColorRect" parent="TestWall"]
margin_right = 40.0
margin_bottom = 40.0
color = Color( 0.658824, 0.717647, 0.133333, 1 )
         GDSC            �      ������������τ�   ����Ҷ��   ���������Ѷ�   ���������������Ŷ���   ����׶��   �������������Ķ�   �涶   ������Ҷ   �������ض���   ��������ض��   ���������������Ӷ���   �������Ķ���   ����������ƶ   ����������ڶ   ���������Ӷ�   ��������ض��   �����ڶ�   ������¶   �������ٶ���   �������������������¶���   �        player            killed                                                      	   "   
   #      0      1      2      >      ?      E      F      Q      Z      ^      `      a      b      q      |      }      �      �      3YYY8;�  V�  YYY8;�  V�  �  YY0�  P�  V�  QX=V�  �  ;�  V�  T�  T�  P�  Q�  �  �  ;�	  �
  P�  �  �  Q�  �  &�	  �  V�  �  &�	  T�  T�  P�  QV�  �	  T�  T�  P�  Q�  �  PQ�  .�  �  �  ;�  P�	  T�  QT�  P�  Q�  �  �  T�  P�  T�  QYY0�  PQV�  �  PQY`     GDSC   
         /      ��������ń�   ���������Ķ�   ����Ķ��   ��������Ķ��   �����϶�   �������¶���   ��������Ӷ��   �������Ӷ���   �������������������¶���   ���������Ӷ�                                                           	   !   
   )      -      3YYY5;�  V�  W�  YY0�  PQX=V�  �  �  �  T�  �  YY0�  PQX=V�  �	  PQY`      GDSC            �      ����������������¶��   ����������������¶��   ������������������¶   �����������������¶�   ����������¶   ������������Ӷ��   �����������������ض�   ����¶��   ����������������Ҷ��   ����������Ӷ   �������������ض�   �����������¶���      res://Scripts/Tank.gd                                   	                        !      "   	   *   
   /      8      <      E      I      L      M      U      Z      c      g      p      t      w      x      �      �      3YY8;V�  Y8;�  V�  Y8;�  V�  Y8;�  V�  Y8;�  V�  YY0�  PQX�  V�  ;�  �  �  &�  T�  PQV�  �  �  �  &�  T�  P�  QV�  �  �  �  .�  YY0�	  PQX�  V�  ;�
  �  �  &�  T�  P�  QV�  �
  �  �  &�  T�  P�  QV�  �
  �  �  .�
  YY0�  PQX�  V�  .�  T�  P�  QY`      GDSC   +      Q   C     ������������τ�   �����Ҷ�   ����Ҷ��   �������������Ҷ�   ���������¶�   ���������Ӷ�   �������Ӷ���   ���¶���   �����������Ӷ���   ��������������Ӷ   �����������������¶�   �������؄�   ���������������¶���   �����������Ķ���   ����Ķ��   ����������Ķ   �����϶�   �������Ŷ���   ����׶��   �����������¶���   �����¶�   �������Ӷ���   �����������ض���   ������������������ض   �����������ض���   ������������������ض   ��������Ҷ��   ����¶��   ���������������Ŷ���   �����������������ض�   ������������Ӷ��   �������ض���   �������������Ķ�   �涶   ������Ҷ   �������������ض�   ����������Ӷ   �������������Ӷ�   ����������������¶��   ���������Ҷ�   ��������ض��   �������ض���   ���������Ӷ�   �         @      res://Prefabs/Bullet.tscn      &   res://Prefabs/Particles/Explosion.tscn                                               	      
                     	      
               #      $      %      /      8      A      B      C      L      U      V      \      `      a      j      k      s      t      }      �       �   !   �   "   �   #   �   $   �   %   �   &   �   '   �   (   �   )   �   *   �   +   �   ,   �   -   �   .   �   /   �   0   �   1   �   2   �   3   �   4   �   5   �   6   �   7   �   8   �   9   �   :   �   ;   �   <   �   =   �   >   �   ?     @     A     B     C     D     E     F     G     H     I   #  J   $  K   -  L   4  M   ;  N   <  O   =  P   A  Q   3YYB�  PQYYY8;�  V�  YYY8;�  V�  �  YYY;�  V�  YYY5;�  �  PQT�  Y5;�  ?P�  QY5;�	  ?P�  QYYY5;�
  V�  W�  Y5;�  V�  W�  YY0�  PQV�  �  �  YY0�  P�  V�  QV�  �  &�  PQ�  V�  �  ;�  �  T�  PQ�  �  T�  P�
  T�  PQQ�  �  T�  P�
  T�  PQQ�  �  T�  P�  Q�  �  �  �  T�  PQ�  �  �  YY0�  P�  V�  QV�  �  ;�  �  PQ�  �  �  �  �  �  �  �  ;�   V�  T�!  T�"  P�  Q�  ;�#  �$  PQ�  �%  P�#  �   �  QYYYYYYY0�  PQX�  V�  .�  YYYYYYY0�$  PQX�  V�  .�  �  YYY0�  PQX�  V�  .�  �  Y0�&  PQV�  �  �  YY0�'  PQX=V�  �  ;�(  �	  T�  PQ�  �(  T�  P�)  Q�  �  T�  P�(  Q�  �  �  �*  PQY`    [remap]

path="res://Scripts/Bullet.gdc"
       [remap]

path="res://Scripts/Explosion.gdc"
    [remap]

path="res://Scripts/PlayerTank.gdc"
   [remap]

path="res://Scripts/Tank.gdc"
         ECFG      application/config/name         tank-trouble   application/run/main_scene$         res://Scenes/MainScene.tscn    display/window/stretch/mode         2d     display/window/stretch/aspect         keep+   gui/common/drop_mouse_on_gui_input_disabled            importer_defaults/texture�              compress/bptc_ldr                compress/hdr_mode                compress/lossy_quality    ffffff�?      compress/mode                compress/normal_map           	   detect_3d               flags/anisotropic                flags/filter             flags/mipmaps                flags/repeat          
   flags/srgb              process/HDR_as_SRGB              process/fix_alpha_border            process/invert_color             process/normal_map_invert_y              process/premult_alpha             
   size_limit               stream            	   svg/scale        �?   input/p1_move_forward�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode        physical_scancode             unicode           echo          script         input/p1_move_backwards�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode        physical_scancode             unicode           echo          script         input/p1_rotate_left�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode        physical_scancode             unicode           echo          script         input/p1_rotate_right�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode        physical_scancode             unicode           echo          script         input/p1_shoot�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode          physical_scancode             unicode           echo          script         input/p2_move_forward�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode   W      physical_scancode             unicode           echo          script         input/p2_move_backwards�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode   S      physical_scancode             unicode           echo          script         input/p2_rotate_left�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode   A      physical_scancode             unicode           echo          script         input/p2_rotate_right�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode   D      physical_scancode             unicode           echo          script         input/p2_shoot�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode   Q      physical_scancode             unicode           echo          script         mono/project/assembly_name         tank-trouble)   physics/common/enable_pause_aware_picking               