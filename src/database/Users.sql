PGDMP                       }            users    17.2    17.2     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            �           1262    16388    users    DATABASE     y   CREATE DATABASE users WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Mexico.1252';
    DROP DATABASE users;
                     postgres    false            �            1259    16399 	   direccion    TABLE       CREATE TABLE public.direccion (
    id integer NOT NULL,
    id_usuario integer,
    calle character varying(1000),
    colonia character varying(1000),
    ciudad character varying(1000),
    cp character varying(100),
    num_calle character varying(100)
);
    DROP TABLE public.direccion;
       public         heap r       postgres    false            �            1259    16398    direccion_id_seq    SEQUENCE     �   CREATE SEQUENCE public.direccion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.direccion_id_seq;
       public               postgres    false    220            �           0    0    direccion_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.direccion_id_seq OWNED BY public.direccion.id;
          public               postgres    false    219            �            1259    16390    usuarios    TABLE     �  CREATE TABLE public.usuarios (
    id integer NOT NULL,
    nombre character varying(1000) NOT NULL,
    apellido1 character varying(1000) NOT NULL,
    apellido2 character varying(1000),
    email character varying(1000) NOT NULL,
    telefono character varying(100) NOT NULL,
    rol character varying(50) NOT NULL,
    foto_url character varying(1000) NOT NULL,
    estatus character varying(100) NOT NULL
);
    DROP TABLE public.usuarios;
       public         heap r       postgres    false            �            1259    16389    usuarios_id_seq    SEQUENCE     �   CREATE SEQUENCE public.usuarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.usuarios_id_seq;
       public               postgres    false    218            �           0    0    usuarios_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.usuarios_id_seq OWNED BY public.usuarios.id;
          public               postgres    false    217            ]           2604    16402    direccion id    DEFAULT     l   ALTER TABLE ONLY public.direccion ALTER COLUMN id SET DEFAULT nextval('public.direccion_id_seq'::regclass);
 ;   ALTER TABLE public.direccion ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    219    220    220            \           2604    16393    usuarios id    DEFAULT     j   ALTER TABLE ONLY public.usuarios ALTER COLUMN id SET DEFAULT nextval('public.usuarios_id_seq'::regclass);
 :   ALTER TABLE public.usuarios ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    218    217    218            �          0    16399 	   direccion 
   TABLE DATA           Z   COPY public.direccion (id, id_usuario, calle, colonia, ciudad, cp, num_calle) FROM stdin;
    public               postgres    false    220   �       �          0    16390    usuarios 
   TABLE DATA           m   COPY public.usuarios (id, nombre, apellido1, apellido2, email, telefono, rol, foto_url, estatus) FROM stdin;
    public               postgres    false    218   �                   0    0    direccion_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.direccion_id_seq', 123, true);
          public               postgres    false    219                       0    0    usuarios_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.usuarios_id_seq', 131, true);
          public               postgres    false    217            a           2606    16406    direccion pk_id_direccion 
   CONSTRAINT     W   ALTER TABLE ONLY public.direccion
    ADD CONSTRAINT pk_id_direccion PRIMARY KEY (id);
 C   ALTER TABLE ONLY public.direccion DROP CONSTRAINT pk_id_direccion;
       public                 postgres    false    220            _           2606    16397    usuarios pk_id_usuario 
   CONSTRAINT     T   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT pk_id_usuario PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT pk_id_usuario;
       public                 postgres    false    218            b           2606    16407    direccion fk_usuario    FK CONSTRAINT     y   ALTER TABLE ONLY public.direccion
    ADD CONSTRAINT fk_usuario FOREIGN KEY (id_usuario) REFERENCES public.usuarios(id);
 >   ALTER TABLE ONLY public.direccion DROP CONSTRAINT fk_usuario;
       public               postgres    false    4703    220    218            �   2  x���Ms�6���౽��y��$v*'��L;��)�B"T����79��C'�\���.(ʦ��#��b?�}�E"J)�d�
gKk>��u��}m���h
ϭ����F��O���\wwBf2�D�(�����wbfhm[qѫC��E�őȃ"e���Ԇ�2[w㔣�&Q^b�"(rQ���^9jj��7/¹�����/��n�3��]KQ�{���� �N�8��÷��y�k?Z��c��(������"?��V�R�U��p���v�30�4��~��g1_�����Fdyg���DY���~��T��(SY�_y8}���[Ԫ�<*��&���M��e&�/՝j�l���v��9�ucC��L��Ҭ����U$��V��r�
�2T�P3���JT��b�U�^�n���0�}�,U{���Zw�N9F>�TT���{kjN��}Gu�{X�ԙ�!�s���F�^�W�ܛT�����F������� ����$�9����ݷ��\�zg�GV0�q��J^gqu�xEM����GF��Vy�������W��&_���������Y� f��B�+�o�!й��������2���`V��a��Ά�h�4ˈ�iO{�s^4U).��r-�@����y�s���mW%#���ƅ��Fg�'X�����37�krXg�:��SƉ1Ϭd�����XC4oȰrLrzB��m8[�;��	�QsC!�:y�õ�T[|�b9��r9$(��Q+g��;ğ�E%�c��W��[$��O
��3L������9N��nm�
�,{OA�L�ֺN�_�x�r�:hl敏�\ZC$nXi����5�8���x%���l�+��K�V� X�:�>�!Db�y�?��p���='������Z��9ʷ{h�yO}g���)�T��H��6x�����H#b{�>��A.�T9�j�hT�vu�l��з�hJ������8��g��$�*h$s#�j$ж�/�*��͐�K�@�;i��ad ��7j���[��fO��;�_ĩ�U��#�P!�:r�
���mu���F�<��	7E�Cd�SY��(���&HJ��=�x�L�B��մ��O�qpɥL�;��^��K>�#	�(<;;�A�I�B���u�ah�&f�_҄łk��ȝ��Y�*�{H$8]Aʿ5���B5l�n���r�����6�F��\ �^A���5�����)Gr
-��vC����^{П�N�ī�"ey����mO{��[���ǂgV���H9B{�6�o7F�4�f�@7�䨖�`2�NYpX�ǀW����x	��F�O0�:��5�)��<L[����E���>��"����o/�L�Վ�p�
�8@0�L�/�%����6��;@`�a�ڀ�}������b��*)}�.N�0p@Y�j�8�=Y��a�DT_��T5��k�$���hR�$ $�8Q��?G���G�Ts!��i����>ئ#ݨ�P:9e2�UfP�x�SZ���֊�q�,�c�� '2q�P���2�a SG�G("2e��š�,X�0�c�O�3iU�_/� �]l }      �   L  x�}X�VI|�������}��i��fi�|�͙�\Ea-�$6}�DJ`�dW��+�%"n:ּ��.���͛ٲϫ�dy�7MB��ӹ�f��R��J�Ƨy�h�����ڶ��?Ҋ�y<��[\��8�Y�DR�H(1��ڔ�����v����9�����Y�q��8��� ���F���U�>�^,�ܶAK�Dpω����$���\HJd;8^4or����W~��ͅ�w=0�m|DE��������>�+uu�Ja�4B�h&�)N\��0iE.)Qa�(ds��~���̳�Y��{(P���GP<�G��5%ϊ >gEda�X#����ը� �j&9 	�_4�y^ ��n��}�\5���>�� ��n����[[p�)�BUM�̀�/�qC3�&�0 ���<���r�Q�]S�����5֖_>~|z��[���yG���`��Gµ��X����,��!�����Q�X6�.��q�{���������K�0H�E��(	+�8e"�2gW��ޜ��C�κ�3�9����B��Ѹ�?�pri�[e�0E���D&ƈ�1ufQ��.���w��ˌ�~�}�W��a��p>���Í;;��p��RV���-	�
bL
�2��B���²y��נ�g����j!�d�HoUx5iS2�1I�2F��'}y�A/�t��,� ��EYwu<&˕����-�J�c�8�L��ȯ��1z�<�% ɉ��5��Qb<�Ӽ�2���{U�Y�F�
�ϑd\|�ߎ�Z��3�g�CBg8a�7���W�J.�`@�m.�,�૷��Ms�+g�#��j��b򰾿u��%�<T�*��a"
#�:̥�^�8 Ӝ�0[6��1����� nkp�#�Ӷ���ˍE���&�	ݰ�8�,¸�t���A\�~���[�Gd��du���fY��~���N�竛�s+UJ��K�q�&"�,Q���jނ����?�(��=��E7��pĮƺ�|}?��n�b�ǈ5Ș�@5'e�,V�$M��n柋�k���!�k��	c�a�VWG��Z�Ka���!�@!@΄"��Ie܁LX�?�վ47/z��1��i�NB�8�ץ8~t'�OכV?$���
�-���hn�N�0�� �k.����l&~�7��b�����~ڽ�ߒ ������I��t�Z�r2��	�`��T4Q���(*��Q��ɸ�O��w]�3�D��=T:(�G'����ZN���y $�����(�T2L���K}�ߓq��}㷱�$H���v������q��e�(hs!!I@p�2��r)GXJc��5C�O�"-7L��v�m��O�r� �����t������"K��'"�j�\-e�](�3{����
7N�S�'��Y�Z��;�O���h���/��JF��
gi��̽��i���x������&$�� �x�6�_g�4ʎΆ�tulϯu�"܃��� ���ąXHa��`-y���e�w	~����H�}�l0%�b�G�b��Չhuq4&��#I���l�Sqo3l>�1�m�%����:W{��b�{�ښ��P1��叵����v��>��lY���RY�k�pĈ$}�>�����w�.�}�AQn�x�I����&�4��F��R�J�9'�Gb��0�B*jʙ,�e;;݊��;��onk|�$����c���_�\Z��>�4u�s0��b�Z�`h�*C~z}a6�{��K*�6������dlN>>]<�-6;g;�*_�BP#F8���<=`+��������5�O��bN�؈��>��|�����)$'g�q]�@�=&,kˆ��*�W�n�c�by�WM��\e���F�޼a��ϭgQ`냯O ,)+Y`J��R�'Yǔ��/�v���B⾱��7��Sg��X��G�a~u�*&�������'l�����2z�C�f>*vu�)��X�v�����V����rt���_�Z_L`��O� ��`/��u�4Gka7��@E��*r��yYKrwP�&��c��t���LD8k��I����I�H����&�`1*"�T��5S\ގ9�Zs�0��o���E�X)A[8,��;��%)� �VI���4ov���L�t�F1�b�����c����a��X�2ܕ�"���֎�(��h���{�g�x!��~p'���Z>�$n�o�L݊�&K� �6y�8�-@� �Bv L5��E7_��4(
v��*�˱~d���X�/mQ>��uO��� MU8a=R�m��b��@�?��*φ
�����ĕ~*���]�L�ɬ�`�z �o�աnޕ͇n���m�˲�~�D�����h�Ƽe���e-���Y���(<ж�����:.���)ء���b_�sJ8�Q�/����U<m�^Ѐ2hNi�@��c�,v��=���/���Z����y*ǔsz2�y�M:�&Ÿz� �D�!Yk����a;��b��������ޭ��p���tC����e	��{��Xp�\�0�?���kl��[;g��p~u�f<Vm���f)B�)��N0+X�>��:��a.�+��/��пT �^����z���&%�@
�Vf�}�Ԃ;Oq>�Nh��3h�N�v_�]�gW�/IX-n��e���X�I���ץ�,�1bI��xD<H�i&˲�hw����_�Y����˔_��y�sR����`8U=6-U(��E
l�j��C��-���r+�uz�9�_���H����J%G����9k��9�r0�n;��z+���1����m\�H ]�n����J�N���$zb
�!Gx�9fd�th��]�og�{���6��m���M�p��}kX�փ
����4L$t��Ք�<�,����~�?4��      