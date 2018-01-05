PGDMP     3    
                 v           csrepo    9.6.5    10.0 6    �	           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �	           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �	           1262    41264    csrepo    DATABASE     d   CREATE DATABASE csrepo WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C' LC_CTYPE = 'C';
    DROP DATABASE csrepo;
             score    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            �	           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3            �	           0    0    public    ACL     P   REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO score;
                  postgres    false    3                        3079    12655    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            �	           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    41265    author    TABLE     i   CREATE TABLE author (
    id_author integer NOT NULL,
    name_author character varying(255) NOT NULL
);
    DROP TABLE public.author;
       public         score    false    3            �            1259    41268    author_id_author_seq    SEQUENCE     u   CREATE SEQUENCE author_id_author_seq
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.author_id_author_seq;
       public       score    false    3    185            �	           0    0    author_id_author_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE author_id_author_seq OWNED BY author.id_author;
            public       score    false    186            �            1259    41270    authorpaper    TABLE     \   CREATE TABLE authorpaper (
    id_author integer NOT NULL,
    id_paper integer NOT NULL
);
    DROP TABLE public.authorpaper;
       public         score    false    3            �            1259    41273 
   conference    TABLE     �   CREATE TABLE conference (
    id_conference integer NOT NULL,
    acronym_conference character varying(30) NOT NULL,
    name_conference character varying(255) NOT NULL
);
    DROP TABLE public.conference;
       public         score    false    3            �            1259    41276    conference_id_conference_seq    SEQUENCE     }   CREATE SEQUENCE conference_id_conference_seq
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.conference_id_conference_seq;
       public       score    false    3    188            �	           0    0    conference_id_conference_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE conference_id_conference_seq OWNED BY conference.id_conference;
            public       score    false    189            �            1259    41278    edition    TABLE     �   CREATE TABLE edition (
    id_edition integer NOT NULL,
    year_edition integer NOT NULL,
    conference_edition integer NOT NULL,
    publisher_edition integer NOT NULL
);
    DROP TABLE public.edition;
       public         score    false    3            �            1259    41281    edition_id_edition_seq    SEQUENCE     w   CREATE SEQUENCE edition_id_edition_seq
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.edition_id_edition_seq;
       public       score    false    190    3            �	           0    0    edition_id_edition_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE edition_id_edition_seq OWNED BY edition.id_edition;
            public       score    false    191            �            1259    41283    paper    TABLE     Y  CREATE TABLE paper (
    id_paper integer NOT NULL,
    title_paper character varying(255) NOT NULL,
    pages_paper integer NOT NULL,
    year_publication_paper integer NOT NULL,
    first_page_paper integer NOT NULL,
    last_page_paper integer NOT NULL,
    conference_paper integer,
    publisher_paper integer,
    edition_paper integer
);
    DROP TABLE public.paper;
       public         score    false    3            �            1259    41286    paper_id_paper_seq    SEQUENCE     s   CREATE SEQUENCE paper_id_paper_seq
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.paper_id_paper_seq;
       public       score    false    192    3            �	           0    0    paper_id_paper_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE paper_id_paper_seq OWNED BY paper.id_paper;
            public       score    false    193            �            1259    41288 	   publisher    TABLE     �   CREATE TABLE publisher (
    id_publisher integer NOT NULL,
    link_publisher character varying(255) NOT NULL,
    name_publisher character varying(255) NOT NULL,
    acronym_publisher character varying(10) NOT NULL
);
    DROP TABLE public.publisher;
       public         score    false    3            �            1259    41294    publisher_id_publisher_seq    SEQUENCE     |   CREATE SEQUENCE publisher_id_publisher_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.publisher_id_publisher_seq;
       public       score    false    3    194            �	           0    0    publisher_id_publisher_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE publisher_id_publisher_seq OWNED BY publisher.id_publisher;
            public       score    false    195            �           2604    41296    author id_author    DEFAULT     f   ALTER TABLE ONLY author ALTER COLUMN id_author SET DEFAULT nextval('author_id_author_seq'::regclass);
 ?   ALTER TABLE public.author ALTER COLUMN id_author DROP DEFAULT;
       public       score    false    186    185            �           2604    41297    conference id_conference    DEFAULT     v   ALTER TABLE ONLY conference ALTER COLUMN id_conference SET DEFAULT nextval('conference_id_conference_seq'::regclass);
 G   ALTER TABLE public.conference ALTER COLUMN id_conference DROP DEFAULT;
       public       score    false    189    188            �           2604    41298    edition id_edition    DEFAULT     j   ALTER TABLE ONLY edition ALTER COLUMN id_edition SET DEFAULT nextval('edition_id_edition_seq'::regclass);
 A   ALTER TABLE public.edition ALTER COLUMN id_edition DROP DEFAULT;
       public       score    false    191    190            �           2604    41299    paper id_paper    DEFAULT     b   ALTER TABLE ONLY paper ALTER COLUMN id_paper SET DEFAULT nextval('paper_id_paper_seq'::regclass);
 =   ALTER TABLE public.paper ALTER COLUMN id_paper DROP DEFAULT;
       public       score    false    193    192            �           2604    41300    publisher id_publisher    DEFAULT     r   ALTER TABLE ONLY publisher ALTER COLUMN id_publisher SET DEFAULT nextval('publisher_id_publisher_seq'::regclass);
 E   ALTER TABLE public.publisher ALTER COLUMN id_publisher DROP DEFAULT;
       public       score    false    195    194            �	          0    41265    author 
   TABLE DATA               1   COPY author (id_author, name_author) FROM stdin;
    public       score    false    185   :       �	          0    41270    authorpaper 
   TABLE DATA               3   COPY authorpaper (id_author, id_paper) FROM stdin;
    public       score    false    187   7:       �	          0    41273 
   conference 
   TABLE DATA               Q   COPY conference (id_conference, acronym_conference, name_conference) FROM stdin;
    public       score    false    188   T:       �	          0    41278    edition 
   TABLE DATA               [   COPY edition (id_edition, year_edition, conference_edition, publisher_edition) FROM stdin;
    public       score    false    190   {�       �	          0    41283    paper 
   TABLE DATA               �   COPY paper (id_paper, title_paper, pages_paper, year_publication_paper, first_page_paper, last_page_paper, conference_paper, publisher_paper, edition_paper) FROM stdin;
    public       score    false    192   ��       �	          0    41288 	   publisher 
   TABLE DATA               ]   COPY publisher (id_publisher, link_publisher, name_publisher, acronym_publisher) FROM stdin;
    public       score    false    194   ��       �	           0    0    author_id_author_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('author_id_author_seq', 1, true);
            public       score    false    186            �	           0    0    conference_id_conference_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('conference_id_conference_seq', 1845, true);
            public       score    false    189            �	           0    0    edition_id_edition_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('edition_id_edition_seq', 0, true);
            public       score    false    191            �	           0    0    paper_id_paper_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('paper_id_paper_seq', 1, true);
            public       score    false    193            �	           0    0    publisher_id_publisher_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('publisher_id_publisher_seq', 4, true);
            public       score    false    195            �           2606    41302    author author_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY author
    ADD CONSTRAINT author_pkey PRIMARY KEY (id_author);
 <   ALTER TABLE ONLY public.author DROP CONSTRAINT author_pkey;
       public         score    false    185            	           2606    41304    authorpaper authorpaper_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY authorpaper
    ADD CONSTRAINT authorpaper_pkey PRIMARY KEY (id_author, id_paper);
 F   ALTER TABLE ONLY public.authorpaper DROP CONSTRAINT authorpaper_pkey;
       public         score    false    187    187            	           2606    41306    conference conference_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY conference
    ADD CONSTRAINT conference_pkey PRIMARY KEY (id_conference);
 D   ALTER TABLE ONLY public.conference DROP CONSTRAINT conference_pkey;
       public         score    false    188            	           2606    41308    edition edition_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY edition
    ADD CONSTRAINT edition_pkey PRIMARY KEY (id_edition);
 >   ALTER TABLE ONLY public.edition DROP CONSTRAINT edition_pkey;
       public         score    false    190             	           2606    41310    author name_author_un 
   CONSTRAINT     P   ALTER TABLE ONLY author
    ADD CONSTRAINT name_author_un UNIQUE (name_author);
 ?   ALTER TABLE ONLY public.author DROP CONSTRAINT name_author_un;
       public         score    false    185            	           2606    41314    paper paper_pkey 
   CONSTRAINT     M   ALTER TABLE ONLY paper
    ADD CONSTRAINT paper_pkey PRIMARY KEY (id_paper);
 :   ALTER TABLE ONLY public.paper DROP CONSTRAINT paper_pkey;
       public         score    false    192            
	           2606    41316    publisher publisher_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY publisher
    ADD CONSTRAINT publisher_pkey PRIMARY KEY (id_publisher);
 B   ALTER TABLE ONLY public.publisher DROP CONSTRAINT publisher_pkey;
       public         score    false    194            	           2606    41317 &   authorpaper authorpaper_id_author_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY authorpaper
    ADD CONSTRAINT authorpaper_id_author_fkey FOREIGN KEY (id_author) REFERENCES author(id_author);
 P   ALTER TABLE ONLY public.authorpaper DROP CONSTRAINT authorpaper_id_author_fkey;
       public       score    false    185    2302    187            	           2606    41322 %   authorpaper authorpaper_id_paper_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY authorpaper
    ADD CONSTRAINT authorpaper_id_paper_fkey FOREIGN KEY (id_paper) REFERENCES paper(id_paper);
 O   ALTER TABLE ONLY public.authorpaper DROP CONSTRAINT authorpaper_id_paper_fkey;
       public       score    false    192    187    2312            	           2606    41327    paper id_conference    FK CONSTRAINT     }   ALTER TABLE ONLY paper
    ADD CONSTRAINT id_conference FOREIGN KEY (conference_paper) REFERENCES conference(id_conference);
 =   ALTER TABLE ONLY public.paper DROP CONSTRAINT id_conference;
       public       score    false    188    192    2308            	           2606    41332    edition id_conference    FK CONSTRAINT     �   ALTER TABLE ONLY edition
    ADD CONSTRAINT id_conference FOREIGN KEY (conference_edition) REFERENCES conference(id_conference);
 ?   ALTER TABLE ONLY public.edition DROP CONSTRAINT id_conference;
       public       score    false    188    190    2308            	           2606    41337    paper id_edition    FK CONSTRAINT     q   ALTER TABLE ONLY paper
    ADD CONSTRAINT id_edition FOREIGN KEY (edition_paper) REFERENCES edition(id_edition);
 :   ALTER TABLE ONLY public.paper DROP CONSTRAINT id_edition;
       public       score    false    2310    190    192            	           2606    41342    paper id_publisher    FK CONSTRAINT     y   ALTER TABLE ONLY paper
    ADD CONSTRAINT id_publisher FOREIGN KEY (publisher_paper) REFERENCES publisher(id_publisher);
 <   ALTER TABLE ONLY public.paper DROP CONSTRAINT id_publisher;
       public       score    false    194    2314    192            	           2606    41347    edition id_publisher    FK CONSTRAINT     }   ALTER TABLE ONLY edition
    ADD CONSTRAINT id_publisher FOREIGN KEY (publisher_edition) REFERENCES publisher(id_publisher);
 >   ALTER TABLE ONLY public.edition DROP CONSTRAINT id_publisher;
       public       score    false    2314    194    190            �	      x������ � �      �	      x������ � �      �	      x���[s�H�6x-�
��7���)�wIl$MPR���,a�"4<����7��SV Ա�3m[�*�!++��S���|4��G�x��_���Yv�����?����on����m�9�ݭ��ֻ�O��U��<���o�m��������>��/�6�v������g��a�N�W��p��|{/���~Om%�t���Xo���y�UC������<-��Z�2�˃҈���1��Ϸ]N�EI��<�6ٷ����s��c�m1ZT���+�c�}���:�w4jM���~��|�{z���ḣ�`I��KA�x}۟/v�������|�m���j���ɟ�ôi]�6f�?�m����l��'0���ϟr���l��է:N�3����[�ޮ_2Z���S�;,��hW��^ͤe��;�||:�|���g��8@�d��~�ߏh*5Hr���A�s�h>��5�[M�΋M����H�����o��n�D�|X2�/m�6�_P�M�����G�7��gj�3�'pHoǭ�5L�K��qg����FS������m�O�ﴵm�w�T��Č�	�J�8�'j����?�G_s��N\�v���@�ݗ��>����Z-N2��ֺ��_L�6FD���*-�Ǝ1��:�2����׭>�61���w�~˰�gt7�nպ;���jO�y�|����=S��o�#�Cе������;~3⎆�|#N�h��	d�.J����I��#]8u�������钉f�
Ac<e��̴�Q�I�|""�$�x�^���&c�2d5��ǜ���`"JZ�t����#�d�ǝf��V�F&�dZ���.��LB�T\���������M�n�>]2�+p�㡠=T�=9���������)�,�kI�B<{s�Г�GZ�,�=M��US�3N�>�a
K�/l�G���j�����i�δ7���	<B��N>�LW鸁�	`�8����y~(�G����/D��3�V|���遗t��o�L���R縱P��z��W�܏��LA��V; �q\{��=�s��̿��_j17�Mg���#���M��)�x�j��5�?�-�O.������c��W��]P�8��:&I�5�
�6w����Ov�x��x��L��d���ȅ�GW���}���{�-�7�R`�I�ƴ�'\�4����G��@�{�k8���.��ˊE�|ab�=)6�z�
ܨ.��fz�F���tM̈���ӻYN"��,V�	U�~khr��;Z%����3k9��M��X�Y�2[cK��=�;�;�"OB�~r�t�m���%�3���g'��z�)�G�$/�t�� �F[�)����X2����9�~d��]S��>=������i�v~�ut#���|�vo�X&e���웑�ͽ�\�|w��=3���iہV��I�|>)M�	��ߓ�s���=������6�g�5�.�"�m��\��k�g&��$���T��2c�]�'�o�x��U�?�N���Y^�Њ�S ��AX�x\?�N:�Կ��	���q��}7(aB��!� 8��ӫ��m����	DNI�}P�$91�����IݲO}&Mh|�����5a*LR��m�V�X�nM�|�g�B�M����ޣک�J;����.�\x����7y�6=x}2�3��Vqd�6�fJeZ���j�tr���G,}�>�/1ѧ�e����$��ԯm��8۪1>���ZB�V�̈��4�x�LGKbK�'�n�ީ�Uu��mPk����g�>X�5`I�O�c�����u�������F����}+6V`�n��C�t�+�|n���&��Z������2	���Y�^�0����i<�"�GO��M�I�o��A ��y��9��"��$�0��rW�m��ם�1�l�b/�$|����s0�oG���ILZ4�%C�t�>�D���K$��jM<t=3zOIbRRW]� �v?r~�� �i �]4����g��4��a��;�!h'�j ��~��P�14('����?�ȷo96!���\@1I��-���??���n��d<WT���pNqθ4��������&�7����>�5�Ȱ���l���OW����[�O�W �$_�ޕ�p�+�Z��t>z��;��
Đ�@��=����������{M_tl�.� *G�R�F���Ч+>j���%ލ�Uq�|~�7c�efFUQ����SOYw~1�������z�kw�W��t�aE9�®�VJ:��!4�"�b���+�l��S�3�c6�FsM �W��@�-߲��Ľ@35d]��;��t2c�b�;S��Y�o���n~�{����o�H@Ē�}Pj���fS�e����[�rO�����<��p���Om�3�h�b#�!�L��AM3�����۟�s����NiJ���W��yh�
Hg�Db���O��� ?�+К�r��X�&��Om�w�� �����b�wqb2D���'�i3�����������|�t̵2/>�Q����ugۨSeHx�@�J	ߪ@F�/n����v���fF����_���S�^I���;��`� ��ln�������$�JH�7^,�2�XAo��7�j3��H���[��O^�q����:��p�;�?�i�`�N�.^<F���$�H�����C0U)Q�� ���@AKa������?8��q��*rt>�K����n�b#gbY���c�o4�t��C5�
P�1��duw�S���s���Z��I ~.���'���&���8�e:$�- 4-�����f��0�rE��Y�g�ȭMBX��F�v�a��a?Y�?�� �!릣�'i�Rbr�ܬ�'ߤm*`�_�x� �4>zw%�RKPA:E|�Q��xT.|�>z��%ʣw�r	�dx$�n�b�y"��|�
��`|p�T��c��fP7��XD'���>t�0�@U�RJ���䵰|<�Z���rw��\�ӹ/3��<���?��<R3>�23~��l����^��/7�m�adV�dI����h���hu}O?�ǈp�;`��7�?F��?fQp�G��ۧ�	�$}׼��"+�jYm��	fXƎW�<T�-{�%NBm�!�OL�g�Z���5�X���3@�;��>��|�L�� u��OB���>�9���Sƍ����0~#9�p�A���0�q?N�ʖs-��^�`����`�N85��C��j_��R6ǻ�G}�".N�a�g6"���%=����9+����J���ݏ,�l�zѠ�G>���]o/�]"j�nُ�A|l�Du�� �-���u��7��'\�p��Į��P-#�N^|��z��Ӈ�s��Y)2|I��C5LX�(lL�s=��+gC?ʼ� 0�N�Z����v�4j�5��M̮YJ�U)�:h�.�W��$�26?��0�������g�{�l���R/"�k�#�Urt
h�z2���)�^�BI�����5
2j�'���2�x���9^� _ƤF�K�W��kں�=��-��d�/@��O��A��Q�6wJ�G`�o��|����vj���/��_�b�/e�-0=��ɭ��ag��m����]�e6�6o����n�����zj`��k6A��-&�9����y�'G��y]xw�>Ƥ�������{�B_ԐIl9.�
�5�S�r{�n��H��U��)K��.���Lji��<�p�:��J*���0`*|� 6�c[�҃F�GD��u�3#�"߿ZlJ��x�0��l���:ۼ�x�"�}�v�r<�8i����z���5�{Ν�z�D����|K��G*����`<]�^��}��m`�1A)�D�&j��P���Ӫ�Vƒt»��b���g'���
ch�^T|,�����,�U)�%����B���X��^�������\�(�#J��װ�Ћ��|SHJ��0uX�/}ʭ���TC`��p���?S��;���u���li��O'+�)���e�"I��ܞ�:��" _?F��ڭ�<]��MY��g��Q���첵`���n%>���߁�*�+_^��"��F�_b�9Z#���=v�p��g�    �Srr�8���K �{&��-��1�K���|����z��$��K@��Ӻ�Fi��U5j���S��WTe6d|'�P�ʅ��\�IoMC�4H�$���>��p���g�$�i��3�!�����%|zj�(G�e���^_c�z���XRofL� E46S�r�����b�v?��ֻ����+���/۟�P���mM�������_>��\��0�|���8����2�{�/�L��T��,�_/�Ϲ�wlӧ>L���#�\l�F\�����d	N�:8�a�9�Z�a��:�gU&����0a7(=����?r#�Hs�f¬� �%��F{�:���7�.��v��9⦲��۷��Y�B]��<�bfv��5j���b�[�}�74^^2i���������_6�\^29=�n�bP3P���,Z�ѫ������y&�K@��u�x����0�k��V���Z5͵�'��A4ש���]�~^��"w���2���ȣk,�#��
UzE�B����9FA�7��Y�i�q[������������x�q��p����_8�h�tJ�QjR(Y_�{*/��CO�@�����쪗%����tA1��r�e�o'fa�j�{�� ��=I@ޔ}'h��F����r��+Fv�J�&��:�=��!.�=��0!-���O�0�z8��/;LK�E���/�CG��Y[i��t	�9���ى�9Ĉ(���!��#~�
/*�'��(����m�o4,z�[��l�sGқ���(6G>��O���@sǭ4^���AST���_�*��03а �x:f�k��V�(gܟ�U.�Z����A4�l/'�u�Ǭ�V���@��
�?n}3���Մf�A]�,��~��C��j�oA#��K��m.0G��$�Dg	*��TxM���^rS~K6po��s�.��Y�# aӧ�m�e�i�Hpt;/�3�~m��sJ��8�;-8�v�s�U�|F Gw��M����\! -f������ ��&Z�u�ݜ��_��X��c�yI�� 1�8��G�;�$��~���Ox�����+@�42݄�ڬ8��[_l��� Z*��x���q�r7��
�Z�»�:s>��Z��D&Z��� QCP���I@�i�����0D0hj���e������z\�ү��t4��>���{P	�� �M�@i3:=ha>�_��&�<��\���9������It����<`bby�d�B9(��T0�1N�=��"�ȕHF8e�_�x�����L�Q�������a��߉�(������.�7�W�z5`rߟ��{O���Hg���	b�Kj�����+��)��qi��0}I�3�#8�ICB��C&�)n��*�78Sp9d�J���i2�6�]V4�"5_�!����`pM�N-�L]i���J��tb��yvYZQ��&�(�Þ��,r�{��[��a����Gj��_l��U�r�<0-IX�甊@��á�*�
��io����L��c�w~c|���:���+�R)xF����b�}r�u� �:2%>�9PI-���.<�/�GS�-x�O�U�;�0��ԅ�W��m�y��-!��y�o�$����y4�!���eoH�Xo�j�7Ŏ����tRb��Qkodiݡ� ��<�K�c�+H�K��0T�˧����p4�z�O�i������������o��������>]5/7Tש3�!Q�K��j/u�9!���z��s0N�`��OHƴ�d).FBԓ�Fj�0�� ������BˁmY^�óD�1��IZ�����;g���γ�y荂U���,5�0�<����&dX3�ǳ��2X]��O����e�Rf������ѼĆ��>-��I�1��4��^\!o� ?�1������& Y��չ:�*/�%�^�������Ñ� 6�o$Hh�8�C�.�绗�V/�#�����_|�Ħ�^F~Z��91�ۆ�Y/�vn.�w	r��ۭ�ժ���a����D)�7C���*�����smX��IH�WERtg�s�NpլK�h�r���8s���[�y�z{�u�
�{L������ ό�R�n?��@�����,�u �0���#l��&](2W߹�I�3�@5+F��ˣ�F͓R��=-�q�iܳ�1:3̢���D$��t�8s1�_�����
��g.̰�~�a�y>�����t�}�BW:%1��aLz>g{��"�>�=�` �թ2��ϗ��l�����8a�7 ��:Se(�]��p^�%h��r��bƩ�K4����7�V:�kNM�ivA\�=cF�i��n�r�S+&�L��z��U��.�a�z1��~aB��CՋ�d�i��d���c�K�+�qͧAS�?��̀2�� �"n	Y�i*^�{����a=��i&������`G�xti;�0^��<�����
��0F�Z{�j�5�L-��a�)<�%�u~�'1l�Y��
 M 0���}Zv�m��g���\���<7��i��Rm��0ĝFS���yn/?dv���i�X!&��p��F��=��h���In;=�nF���èv�X�;�=��hwJ*g�(�Mq�>뗐g�N'q�x�'�i3d�N+�i<�Øs:e&no{Zl~Q�J�Ҁ�a:MJ��}��m�f��,�g�3��+�(t:����LnVn����y�ћ�iM�0"�.+v�@�㞱�����W5��a�9]�������WA��OFΆC9���3Ԝ>"�߲3vy�П_^��`K� 6����H�:�S��1꼚D����w��(H��$���ʸ��,��0MU��W�6������G�ٖ�C���i=,��>8�r����p2>��[�#��<���'���o�����8�"W�nN#�G��?>��liA��V���ҩ�Ǽ{�����Oxu�!�9��cE* �H�`c��<����Zzi�`��y�N�.�0�J�e���_Y��t�4<,'�A�(��F]nĻ�������,f;f��z���VJ��yo7��1;;�zBx;rt�L �H7�
2�U��� ����������G����?M� r��c���E��C6���Ez� w|�e<�Ʊ_�pV�`��t���D�v�R�=�3���;�^Lň�!��tt��g�Y;�p.��Qk��j,��v|�U��☁ێ�A����:�w ގa �s| PvݤLKO����ʅ�$*g��<�d���z"V# me}F�=��<���k�Ȋ���P��1Mu��I�J�6�m�<n'��;���}7;��c��<Eޕ.���8��3�r=��/�B�I�)"�:޳�w_�<a6�. �q�x�H��l�%`�u��S��}��/��������;��u���E%'V�Dw����td�@U��?��2�Ii� ��YNҕ�m�����yxB���x?T~;�`�!���@�����jj��l�P�0�%(�P�<��#���lu�y�$v�|N��'�l��<��-B�_��͚�'�j��l�������8��q�x|��s��[�{7�`�.0��m����.;d�G����v69uM"�qzl#�S1�]�<�BX�}���IIe���X��ݠ6��S��xr;Y�S�'t�V����O����}w�lp/�����U@f�� �	��I@ƀ��F=@-�Y�My�"�'2�f]n�A�*��q��9��C��qL,���JCs��Ӻ�,ܻs�l�:�Nx�?�kNf]��t��xio���Z�ʹ
lw�L C�-�pw���`Ѳ��;N&.-avS �R�
����:;N�Z!Ę������:�MR)o��a�	��n8�y��Lb��{ v\D�=*��W�v��G��,�&�<R�"+�k�yϧ#�T
������$��&[�u��oS�.:j��u��fg"P�&~���Q/��r)�-������:Nτ�L �����쒉��L ip(�Sǈ��G��w��RCP)��E�D��lt�&Z�n	��x�=��Hʙ    ���T�t����y,�$b�M�D=q�,�Goa�
p�x�\O�5V�߇��]�����%��~rʇ�wS���G�g:K��`3��q�ycLF?����o���O��ي�C��3v�n�Id�����?�rs�r�ۋ�*���D4�bd�&q �d��N㑂z�&瓮}a�yV�.�֘3���>�M�Mfo�_n��RP�ϳ-�Ƿ7�k_�t���#�5��I�����׳����ǿ�
|����8j��Q��/��*�8,���������n}���5fŲ泵ZePl��A���� ]@�q%H^")��Ķ��"���|�Ƴ��5� �ڎƗ!޽�-�7�~�q}G�����a� Yc.Grr��"Iw��1�������πr_Pg;`����-9�𤙛���8`2�o�g3�O*�g�A��Wg!��L=��C=����n$4|�9�-V�0M�]�f�j?��I*��vt9��B�0�%�ۦŖ*m+u �ʢy2���rAe-�����<_�1%��D����;d2�?����;dZ�t�X�;C�6r�;�!�RZ��V���!�[�n�)3bwȴ�~-���`�S�P�a=9h���ޡ�}a��{��:�ߐ�	��|'�*���x����8�!c������M�{�Wa��,��C�%B�s���xc�<��I��U.���x�q�UVI<�x��Xܰ���y��|@n?�ߕ��cE�c�n|�ɬ�ف33�Ϝkc�]���Z� y�����{��.Z0�l�݇+��"�q�������r�S�Ӌ	[���M"z*j0p|�.��<m~�!�!(�
�Tb-oE"�ק ߘ!�]��B�N��I:�dX��/1fy�=@�4���;�:8�,/�����ѫ�����7�M̷���}]f-G�3^�w�Z%��������n����se��~���:�}��>�n�����'�Gz@�������e��M�W~A=@ǆY�'��AWL��8N�l5�I�O&O
��q�$��T1�Y�����*Ө)|;Up-&bKF�Y�Y�0fHs������
hS*�MK����8�yu"Z?s�Ȼ��L#́>��O�0��A����d|Vl[7��>Xy *��vet�r�:�3�]=�P�0�Q#�	�j?� �1�I�7�us�1N 5�9�}�։tW��=���xΥ!�􏖒^�D Y�sv0����AkQ�Xg���b��\g�D�{���n?\�R֒���!U�0�x�`��_Ǘc��,�/��4~G��7��O/��q��tmuz�vchG��M=A����g~u��v�mY9�Փf|nFۭ���mZBQ���Qf3�S�����4�,��2*��� Os.����6�(p��b�E@��W��ǩԹ�A1�$j��q:���@W
�#o�wa�O�:��;1O��R��K%�Tv�vȲ��JS҉��SR�[�Rke�m�Ô���~'���c�&�Մ�9g�(|U���Z��u���I�eH�u�lcV����ǫ�BnaU�^�Ȍ?g� n�V�4����n��:/�=<.���s����W�ǛW��g����bL{ �c�vThP��ȳ��BY.h�\��v�u��5�j�{?^�[O�i�[�E0���Jnw�ȹ�>^��BZKW��ԟi�~�g7���f�?)����(�#Av��~��N}-�!���^�tf�R7�(͂^��3&�ߖ}I$F�c��Z����e����pF����y�CJXD�ɾ8.�Z�<F�F��[U)��|�ݲ��;M6���"�tI�z��;a>1�Nd�O=�t{Ub�P`j�~HU��h:��VBf�CPA�:^�w�j ���˯�Tǅ���)�ے�O=Fѩ��#gb.�L�e|��(;z��x�ǔJK�dU�J�v��N�v�EN�����/�� zAJP���봨�q�|8�Qo?O���k}TҘV��{�<5M��fY��9�������'��1Dz�9������F���kZ�B#���}Mi����H"\���p���>�Cz��(خX�]�K>[Ck������rZsˌ�?�}tƞ��S_���W}��C����O׊ӵ�|��u��aTQ��b7����6@���n��k��C:��f�7��\H�x�ҟ�L���#�A�� :q���_T���D�:"r���t�M��F7y�yn��P�`�m��
��&�����jK��~h�
����G��~ӈ-������=��7��3Ϥ�0Tϻ����a�R�h̽����bc�����9��0�K��U�O(ߵv����o�a����W�-��m��VQ�B/y�[��*u?���S���5ь3�j�7nN����A;�� ���ʏ��mԛ�݀z�LV�pO��ྙ�
��o�6=��g����w �7��o�v��_s����X���7q�����V���ဢR}I��;m�-��{@~'��O�L�@�D�.����&�������G#D���}�������3k`�ID���p���bܳ�d��%�JkzIb����ߎJm��&��>��b�<t}V!���|�d�u��+/n���y3��sf�9S�I8<�Y�eq)� �o���[�&A�w�oBi��p�l� �U1
q���	��l˳�L����
QD�/�Gc�O���DRu�-r��U�q��I_�
B��d��eH�4J����dzV�p�G�hZ0��<���[@!��n����A Fū��D�i� �Y��s���ڃl�ʏHv��{����_�c�������9s����*��o���%#d�B��8� bU����D�>Yj>+Kup����Rc�����I�ف޽��i(�p:�e~����z��"�
��x�&]�Nj�[@r��%��z ao����E��gs@Wo�������,9���G2Qh���5�y`X*D$9$�Բ[����O�%T���pz�̀�sՈ>��[@�좧.��n��h�-��g>?�T0���Lى�ǻ�_�;�m!�y4��sU�w�ϝy��u�i�l�^��� _�eI�?�H�?������r>f��}�;4�6+���п��ûC��M�Κsq�T�S��,�y� �yP��3�Hx��y��E�˚~���OR/�Y���8`��/Ks^��~ �rWz�!������Th��ڈ�#����;��l���t~�|#v���M�ւD�)W��l���?�����Z�1�#�뢆�W&&5u �IMK�Sּ-���i�H�v!�݂8�z^:���.>��z�q���U��Ϭf�.n����|q��fx�)Di[���m�����r����j�P�L��W�@WJ-R�kx�H�^3�@��k�0S�n��4z��^o�؄����e���<�{x'QS�e%��8UDI]@1�'&t{���If۟9@W��sdy���7l��L�'8�vJ�������>�E�M�)%�`|�W��JDd_�� #�F6?��O����A�q����o�����  U����5�#0C6�X��z�'Uè��t�w��f�����G�}�K��zx��Q��^��s9�Q`�]4Yͣ;ݲ��\r�k��H'dqG+8p��>��;N)�G���*}`�w�h����nN�HU��>���x!��.C�m��jI�5���Y/g������f'5]��J�y�k����+<e�@d�� �ج�9��jʑ���94US�`�#����k�积�ƴ�����.�.}[�t@��,U5�F/?���+.��1@}()|����ռŮf��-<���_��<�  坸�2p�]N ����L��	��Sҗ�6��L�M�+�;jmZ�|Xo�g'g���}��w������I3��;����u�0�\���k�:2��ws Y&m�s�B�����8{�?��DG�h�1ή�nXN�w�դ�$��T�/^͐�T �YȨ7U��LRW����,�#�r��m*�-��5R���TÚ�߉��� u�k�" ��H    �w��5���} ����ȕ�2PF�9��S}/$>Wv����Nv� I�-�U��v���[@.uII9U��X./lP�bU5K�z���f��d8 2y�4|K%(�
�:�-��(������2S:��!T��w)���v3@y�"�+E�����3�ކ9�:ޡ$��:����2IMa ���'b�*�?����'�f��JW�P ��V'�Ys�Z�1#vm����uoy߬�#���z�7lG�8*��B�шT�JK/�k{� ����[�I.�M ʯ��m�@�mt2�)?1 �8A�Y���ĹJk�� '#�?�]g� t���ⶪw^���ENF����DW?�h R�kw)��a~�:3)�j��>�
{����?b�A0��s�Hd��p������|,e�v�����b�,'��r��	�4E�&ŧ�/'�KӺ�7��G�(�u ڜD�FGM�`�����8'��v��E��=EN���d�/� 8�$u�tߠJ�/Az´G��PixN�|rxu�t.��k��k��RQ���>����vy�����9g'<:f���Ju�~�zWE��� �����e~��,Aõ�pM�96����@�j��7d�o��|$��t:z��%��S�i�U�ݴL��a�ђ���h��/�lun��E��Y�E�Ӧ{`�e]�m���(:�5�
9�]=���N��d���4K:����������f��nG��k�|T����"�e��D�8�Ȋ'������qn��A��``=�*�_6Ҿ X�B4���?�_.�_�#�U���M,���)-9}ψ���q9��ˤ�e�m�$���˩��]T�Pk^��L�w?T�]�⨁H���=���~�p �3���u9[�Ԣ5��g5xS�߿�X�=�X�sz��z�ia��8�h�OVW醆��ә�D��.xg�X��n���Ȧ
�E�(��x�c�l��`�,���z׻�z�Z^� ��x�z�\��.@�����Q��X�A_�bް�	m��F���
�*���H���P�i�$k{�O����t�-�8�w?���Is%�V��62��l��o��"״��wS;!+��[����"�&GK��κ5�+jn|P��!�����A�T-"�i0`z��V���׃���t��6���?=Uvp��=�4��V:�5Z�V��nɀ�|�@S�T[�AOul�>��aD�`�tͩ O/��;��iy�%y��U_j˴:���M������q�':I6آ�~f����&�����U�';T�����*[������V��'���LE���q��<�LLq�j+�N����-K=>4 ~gLJ�r8T���bE�(*�|�Wj��e,�4��������*���N�@"��T7E��S��K�4��Tc4N�u�}7nf�W�\����<4�"���z�Yٱ"���J�p�4m�'�\)N�����2~ʚ=~W�`WM_ci���R���g$Q��'���g&؛&%N� k	L����L�7M/�@R���~f*��k'��;Z�_;�I��L�7$��]�m�f�V�����Ƀ��?C�w�?3%�4 "
�C��l��n��i���Y�m��I��ݟm%c]�Y*�M�w㒤�!���{�?��L�·��Ԡ�9�[�V���mV~�lu�E�����S�4Qma�=+�k���(^<�P��l֊&�j	l"����]������o��&X\"Β��F�X��Ҡx���T}d>֠(���l,J��q�j܆�t:g���-�4���kEVX6V����~7������R���+�䟂��:T���,j� �H�W��ڝ����Un�!��(]�&_?~t_���,g�&\��	|�lgM����C茌9T����*�<CeCk�[!����D�u��S��ݧ�2�M�@*������Jw��;��j�&�݇
�}�lj�&��j��W��I�j�*+��Ի�ʦv�5:��0T��Ǭ�����?�j�m�@�sj"*ܲ��X_��Yz31(�nLW��Hpi��ۥ!��\C*�R�ʈ6=�Wʋþ�΀1T6�d� ƪ��'��Ce+K �i�p����5���i�*�X��R��X��aI� (b����}���iq�^��F��CU^	7&פ�(0��Y��0Tf��A�+傠�W�c�T�E"x|�9,�6��ʡ�g��GRt� :���MCe�4�������q3�=�U�����rR��ѫ��&ߡ2w�6�7�ۯ�?Է�qjEce�50S5��Ρx�|Ce�j"��ӂ�)+׬�w\��(�Y���M%U�S���2t5�pH��`�gMR��Ɛ� eɚ7m���x5���,�⊯P�4U'�dW���$��61)&����0t�7�2�#Du��q1jRX��/�*}��V����(߈]�
��k�lW����.�䧡�Z5��U����j���*��)j�5�U�K��C͔M��b���-Wv�E���ح_�
XH�^L�_g���Ƿ.!�Ԅӹ��TCe��j)����Z��.L�M���	����D-(h��瘫t������X��!��+�T��huD�f.C7�T�Ğ�׸|T��*m�Ù��aU+QL��;U)[VVW�)�V7�meo�D���0�gT�˴l *�W�d��ƹ8J����̤�V��Z���

\}��	��);mQSZ�[�(�W:Y4m�"O�t-37�,m���r��Y�x��TY/*�Q*X:ox��T���l]��)�ˆ��;��\*����o�������?����R���s��}� �2�r������a��P$w5�X?��ev���*:m�h*�n&Q ��H����@BUel�z�D��+ek�\ =�fW�۩�:���	þ�_^���
��1h<�ueB�R&2�:�����=�5�+e[U��K+�̐Rʘ���U#5������AW�
�)\&����q:c˕2����x{�`�+eS����]�h��l5i�8s���
����HM�5��+e ��$�L��q��g�R��&��~sحY?��\"e#{�(B�]��2���iȲ��y��a�������+�R���Ѱd|*��}�~��`���݌<t��]�M�j�y� nÉ��g�}lж�PN��R֬ǆC�=])��c��@�h����-��D�x��]�xAގh��ꏓ�"x��q���)�<o�2�j��Q�MQ���|�o��6
��E����Wl���A��y��o�w�t��q�W�|�V�ql�y�ه2�1�ʦ'����)�4���[^�%���H+s*���L��mO��?e�����/#��z ���Hՠ�,N�ű��n��1#,AWlb��c*��;��f�'[m��Y�Բ	�f�`����"�se݀T�u��e�
҅��~���^T~�0���{nG��zHY��e�V2�Tz;Z����\���bΝ	;0��s�TdzAP�]�-�H�"g�&�I�d�缡�L��&��]+1��s��l���l�b3�$����`m���+��LN|�D�b����� ��w�v�IZ?��[lt�p����|^j0|`S���%�Ew���b�d5����ƒ�?]��巨,W�ן(�[h��8Y9�e�"銭.�E�8�p� �D:�.a�|$�F�[E�N�dOE�\���hV6�V5;�yŦ�$�T�k�7�TMe��TX{��d��+3���@�d6xֈ�9b.�􊛦e13�}#��t�Ґ�֙�%�}�y�\����֚D]M�]��M/FCfĮ��qņ�d�tϔ~ǅ��
*Ϸ巏FI&.���)�jc}��ب��ʾd<	��I:���}�v�����|�M�*�6���d��C�C�Ӆ~�.�kR��i��7t:kC�e�=m�5��\�=���@�d�ό��JR��n6�o����(܇�ؔ 9�$:_#v�QJ@9},�h��d��c��o|�%K+W0�䳘�.S���
3@]B��`(�R���n���C�lI'c���i�LP)��r���&�M:
`�����O��    �-�=ز�:����8	�]��Z���Z/�%��{ce��V�uf�/��7y1�LXe������1zL�-:�=�R�ٶ�y��9�U<K'0
l���5�����:�
8�(SJYˤ�q��<��g�A/堧&Y���t�0�"����W��D��
����\���a<b=�j96��V��&$�U�Y`��|Z����.0RR:�h�+͓ͤ�����<,�p1*V�l����\?)޲!f�%�ʇ�+[@?�E�~�-V|��/�r4?�����������P�� β~���E�^����E$��l�����U`�Rw�b\6t�:����ƘE9T¯�G��e���d��k[R��	��HN��q��)���ֲH�k{�H��U�����'e!�AB7�+6�,�٩����^�Ye�"�j�g�x�۟�rB=�
ΨC�}�I��C	�轨āi4��U�Ľ��$��E��M�Am_'A*.��]WJ���̖g	�
��|n��)w^�j[����ڛ����ȻB�@Y�I��w��y��5(j9��S�yb&��-�A2i+�/e���G�}n��91�� �;h'�S�겡Qs6I�����4�{�����V�%�c��-$좨=�����<��rTt]���'��b��VR��+s&S�.�^�ճ`>���%,W��qz<Ny��~��	���z�������d,���Lf�e'���L��٩}D�Fd�,S��f�_#6K�Q9�m���㐪�\��I�w[�>}V�~kp)�������oW�S�0�E��7�ޢ,�*����4��,��`���Rî4D���1-Fi
���i< ��j�4�`L��������D��t|s���w��A�W��m�:f�r<���U.L>#��Ϸ����HL��0k �%r��<<�7�f�� x�϶4��q�T���Ջ2�L���724�KO?�	����A�b�����/4�$��!�m�������@]����%��ӭӀL��E�ұ7���|Q�E�L$.=�A�YoY����#iRF��>\QO��˛���)��%��1	�#�肦��lq�Ŕ��},\���0�/��ƫ�t��;��i�$�V�4i����eG��}���H���� �}"ᢙ'���I&���P>y��[��13e�НI��{�K	�Sn�����)�!�B��c2�/O?����[�R�wW���������YR�tЪ��:4xs���Z�T�\��cq���]����&]��u��������슧�Z�F�ܼ|l�I�6�3�ˉP����4O���m�ZŅ�wQ��|�	R��Pu9�Y�o���m^2R�G�}��ƓV	���YWL�£/'�'M㚩�:��^��.Lv�����E��?T��l������!�d�i1-{���:�R��M�s_e#N�6�����F���T�^V�4�{��4��?��Ja�f�P��%}8Ms
Z��#�\ty,�O'�ҩ�+�eQo����gM�>Yr�MU��N�*���P׶�z�)ZC[Mz�)�1�|1i����=��%<��l|����V>���ҕ�tϳI�"�^��q�`��5-7$լ�W�I���n��N�l�����ʬ���vǥ� ��]����rgDy
���V!�k�խ��M-�I�0�:ҖZ�~V��Ay�M�s ��4e��K��zV����������mJM��ɨ��Bo���b���nu<~�Pj�퀸O��ݔ���Nk��[��jZ�=�¹/_��-}p�/�<�m!���C����V����ν*.�j�3�:�/<d���ƫ���mӲd��ۃgC�C�4/6�)�Y��5��<O0�Q<D���<��ٱu�ؿ�m�/�	��8*gZ�x���h��c��c�S������Nl3f���{�u to��9q܎6�V(l�x�J���|D˃]ؔ��!���0;��$�m�j<F���H�\.DMöyشrêצ�������8.�� �z�;E��c��/(���P��r��_�8�	#i�q	�x��e�b�e;�I�>?�u��,�8����
r��e��p��߆j���d�fC����S�L�O�'�k.�I���|��k晭\��@��O\�ۅ�{�c|;�XK�S��v6��x �'ew3N�����T�bh�ٜ���8i�3z�֎VԕoC�<�칼��}-��&�ǲU@v�K�6�VO�)?-ی�~
BM/ǬJ��PL�iٞ����6�c���og��-������f�����I��<�j@UD��8���f�o���+�Xڮw�}�,m�d~c[�(J~a��ʙ���
��B�/� ޓeut�Ku�0 ��o7)jX�Vw�������+���;W� ���"
�L`����F�&K`��!��	@��[q���?�e�F� �*���HC=�v���~���f/ku]����,���&G@7V�~׶�6�6_�wن:Wz�aQڕ=�~<+�#�N�e���u��-�wś���Q�J4�e<>�,&o�bM�gj?D�� �����6�5_�yCq��O���ooä�%N[��qUz�:��5*=/q�Rbv�/������m��rP�������Η�v_���Sm��(��oP6]_~,`��R����V�>	j��8�S�N����l�T�<޻��0�� �e�Σ۠�#�V���6�9_���kY�O���:�͵�yq2e;u%���Z�1	S(�綔�F_��߆Mf:B�F�����Ц����nA=��	 �?᪵yЋ)l��0�LG�xڂ�0�T��xIM�[�t���)�,�ۄn�и�Ƴ��1¥؃N�0�P�y���9�X�O�����o[x�o>@s�~k�V��	��c	u��d�)�p$(�CK�.��
�ԫ�IH	]'g"KaW.!�-�L�A6@��~:Z.�dk��)2qM<���SN��r��߫�G�/("Zũ�|�z*��*PW�ɰBL��I����.���ݫN
և)[̧��-S3U�fS���Q6��"��@p�D
)�5�w�lY^�6�c�^�$L��c�>�g��i���Q�=Il_�=�L{����`S�гp�h�ҧ�E\Xk�eo5��̀��r͍�A��68~N��k~}S��N_BQRm�~R ������O�t�ԃ���,iRK�?�4��j���� �9�����RSsnRU�;��#󹒇kedu��/fIm��fR�Ee3��$���-�I��`�$B�OB�u!Ye�.eݮ� �OW�Av�> �OF�p�g�_��6����]Z[���}m]���K�W٪HT9�QO݀Opm��2�|$���1D�%��E_��qh�W�RjC~�0u�qg8���V�*�( �Ɉ��?�������.eXC���F�خ�ɦܜ]�<p�*�
�
ƀ��f��_�'���J,_�1�aޅ���z �?�Nδ����#`b����Hs��߳�G���qg�%�!&MUb-�`��+	k�k=�ca%H���= xO���%�ڀe0$�Ɇ�����*�+�1@�	��I�З57*� ڃ��%��mIx��h%�P׆� �\v	=�劼�Y�h5J�m֤�=�6��]vX�|Nkʰ�� ����$�{��4kZ��� �_B3R- ^bF�wN/{�O_��4s�_t89Q���G��c�B���p]��b�R�D魞<351��t�0�Z�G'�QH��R� �*S#F �q�Ѽ�U�z��l��QѲ.m ���Ԃ�r:8�ۈ���&c��ߢ
�'��O�)���A/�ֻ�98�h��}�B���Zo��^�OPLrr�uHHZP�Csx�KiY�z��=튵�f|	���R�_��"\n�_�A�v� B�Ag�yQe��n$����H
Ãt�x��a��ʏ��"��2&�*�ΝL��6f_��+hM�&�BH��L�%Z{��w�5���瑅c`�m&��w��d��6��rt����{���:"֬#��Q�3 �$_��80�C�5��Hw��zJz��@Gr���"
Ql���N�$����j.o'_�    ���t�_�������֌�'� M�YV%��,1�{�.�f'����d�a�9%Z�ά� ������c�w��\2�_�N�xS�,N��9��ߧ��%�3�Y����B��n�8t�w.4��Ƴ��|)�Y�9�����B-{���^�t:�M���O� �����,;T9D]1�����dg�𴃋P=�~�̯',�[Ʃ�d�e�L���A��DƦ*�|���U���n@��
g<s���v���$/�
����3?E�)-Q�,0+=<*j�RW5�K=V�$��s�牼�ԭcZs֜����2R�<��!��!M'�w+;�)2%��q�D�E�� sS"��2�P�T#F���<�����1����`�΀W��Q1��M�/�૓� ����#�Ѐ,^�2��Z�#�>�霸ę���?�O?��>�P�mnWS?�������\g�8�Y���=Bw�|���h��cZ[����I�܃9z�4X�x�V��s�oP���՘�z%I��A����w�DGhʔ�,b�Z���c\>qߤ��/�t'��(��;be̒js�eN��Z��$}TZ�~��9-g�d�)��ŕ�_�W�sT��@��x!���E\^��䫨��D���X�.Z������L5-���a@���tz.��v�����<YF���`���Ve�� >���7V�B-�Ïf(�Zەp��N��#����J����!���'����H�! œ�AluQA�t�-
q�Vp��g
H9e�r��.#��Y��XJ�Y]>O҇��Z3M���J\�aN�t8Y%�>:I�D�|��Z,��/�h����V�l�l���?��]lY�6��U�ٗ@�՘]�Ϧ�4^��B[�Х~6u�1ڰ_4��4U��[Gt��ϥ� )D��dL�� {r{"x�|c�%���ށ8Ak�wXOFN����[�<y@j��!Kr,)��_XY�"x�r"�_�{�:������yy� ��FlE�;��sc��~� ��Ȥ.
�70_T�����T�U�ڶQ����������������\��ΪO��c�h�ؘ��hI;/�Ϯs7����G@�3�1��t� %5�B��2wh�IFc �1�͂DiF\U���	�j �gQ9�2����ї@�g���Z) L�B�t��K`�30�-�Q,�@�g13�E�1�UǕ�QqR��g1��p_){��pi�}�9�<�,��ū�Q[f�I;�0�ip4���~9_��ݬ�A�f���	D�s�� ���g���h���� �i� �0�q�!Y_�d>C�V���r��%`�J��S�ʘ��S�UZլ&�v x�-yv���Uy�
��Ź���g��`y�`Q�R�`��C���l�v����|�}������t�M���Uɕ�ʦ(B:�R�
�6^k��K���d�5j�A�R; � {�vQz�e�I����K�ܿڥc��`X�7�w ��摻����k���_���S�(�Q�lF%8��Cf���F��N��sA4࿅�%O�g��k��U����J�K��l���уϔB��cO�Q���y�5���A���Z�҆� �ig�\� �l�l
��ʐ�D�sO��,O$S���d�FGC��W��.���Po!t�����-|��䱚LԠQs%�|M`䳕���MւJF�!
����b-�8/�z�� r���;��N���~9�/��g�N�۟���6~��|����Ŧ�s��Z��Z�w����{8�|��C}5ˁ����~8��½�:+��vk+A�Z�%����"E�����.���㱟ibU��|17�g��\++��`]�j,Vf���� ̟�+a�����9�gZM�1�T�8E�?��H�s��;��6d�o�A�mtUY�%o�,���˦�2���z �/F#\��ZP���ô1L�SY���϶F{�
/�������29ڥ�tIh����� ��YL`��Q�V�E5���4zW���x^��^��:O�'��m���c9t��x}���OJ �u �/ӥځ|���P�0�v �/F����|�efQ��]q��O[_kS:�u��/ְM/��]�]��e��,Mޮ��h?����|1�p�D��H�N�iV�ʍ��Fw�L���Y��#�j�����¤���U������8�l���\J����.�V�ns�D�ebI���̘T.�n_�/����q�7Ё�$E�*?P��3��t&&߅uc��c^�J�ί�F���7�|i�
=='@#1
���t4��P��-�?�Lr��r=��@ދ��q�Jd�mKbm@u��Q�x���[��$8W8RT<9c��b�Λ���#X��y��' 7�If^PK-���WCv��S�Ec�
�A�U��4���C	D�Ȝ:l��BV��Aw`�����𺊯i��W���S�����E�w��,���1��EvX�4X�A��* �{�G�=vN�v��yW6�mԸ�c��@�q�$���N��<v��x�h�[r�`��y��L�wq���L�;gbF'���z����"�[�z�z�/�*��I��#]�;@�i�d��?�"�e'i�z@�E�L�G͹�iH��xI^dp��]�GO�{i ��_�����S�%�3`�]!����YfK8:3�J����w��/ .���g��V2t͸#��*u/@�}������/n����`��.7���-�
:�#���p�����w7_}DIb0c��pX_R����$8z�܄�����o ?��j���1a{/H��\;i�[���/�����+&�{ ��/��gu�䏀�_0��7�1_���T׊�-��`aP9����}}6p��1*(k
�T��2`�^3���.�������̰�����OZz��%�� ɧ`��镖�U��L�(3��6o�o:����9�N�#��
U A���_�ӓӬ�0���U�+�{��W�/�x^��7;kw��/�,�>�<�����A��b�������ۏ� N�/'��1ȵ��t8�]�
���U]�����z��v6�%��i/w�)��X��b9���{�-�	���_,��ﲿ퉧��U�Vsw���B9���o���[�
ho�nW���\�8+��e�9ʺ^he)|�\��\W/"/�G�.wa'��=�h�@� .}|� ;E�"�]D5�҅=`����2�@[�M��PurǛ�����Ha|:zI8LnUɼY��L��d��L��?��ซ�}u�0~��m]֏n��l���v�*�_b!����j;Wm{����v�刜��k��9�؜����Z<��A�y����t��d�������@��I�=���4R|��fE�MEHe��"z56L�p��t ?5N��������\�1H�W>F�A�l���j�����.s�C��ԅ!`���$�8��bt��Li>����:�j��u����T�v
 ��Sc.���z�������Ƿ�0�r��H���d�#�Ax�o��˿Ȗ���5�;Qs�����d�UeV��ݡ�MAW/����b�r�;���G��g�:��z�pΈ]��zTu� ����o<ς.��#.�'>qү8H��N�ff��� ŗ#��/�N��5KC����y���^B�1#_�4�L�4��.��^�fc��Ԡ�4�Ӯ�;��
ɨ��ݦ�`����i+}h�2?ޕ����R���&��.@l�%K��V���\vW�":�㾢.sUF�.`�%�\ŝWXۗ�dQ�hG�eFډBBW�.��e<�>Bn�|L�����+��v9/�h���vFyh��L���h�7�Kic}��fq;R��>iUuqd���5��02�
<H�������K�f��d^���1S�J��W]@���&�Z����O�([ssO1�f2n�Si�n�����+-�fGs���>�?�O��Ln�A+�q��n� ��b�ѷ̘��f���<�`���Li�LP&M�^��]��nL��    .0i�8Z1�pΞ�>�3Ctͯ'�i���Fj:M�Pf��GM}��t�#[���bt|7SN��'�uo���l�>��|9;�Er��$�]���y4� ��j��Uj]�:��|��M����)&᝭�I ;/I���~����yFw�0/�/+����x�0ِ�� D^�-h�~ϭs}�P~��	<���f+~�J������d��S#���K=R��ι�A����"m]���UQ����-�E(���� �R=	ճ��<5���O��i�}����֕�-}�XX�&���E^.H7B8���u2U��a'�ݟD���q0���Qք��_���С�m�\j�:��v���n9�_ u�.Q<Vq3���( �i�Le�LI�]�`G+�T��L����y�ά�:{]��iuh�Gۈǣ�[����|���@N�)Glze�4��@O����T����ДK`8�3ySTT��+Le]`��h|��bt��)�ٳ�cP�) ���<�n"N[��"�\��	ƽĸ��8��4�ٌE] ���N��ˀ)p�:?�2t �[MG�Yi�B�� +��#SQbvˏ*�ߐIΫ���L�I�Ĩ1%�$�b��&-'���K�~��gl������q"Rg��Z�&<h��}���8ZЪ�TYH�a���prEvf3��}��1�����y} T��I����%W��2�v����>�Q�"��*㔊�Q=��T��J��� �ۢ.�t5�E�������PN/�Dn<F�5����w���\��G2��5��J|Id����g��t�æ׀�j�WL�M��QUӱ-�uM���ھ%�����'\���l5/�a/�x��6��p��z9��h9+{�*��?����Wi���q�����(
/�#���z=��)���-��e�s4�UD�mا�����`��0����**��X�oG�'����kkQބ0Ӵ�,s�7鄛l]���/�ͣ�rV�2D\6��(�s���R�^�����n�`v�ʹ"y&�^��<��f�s,��u�OY����fjb�<����A��xPlPl:�r-�������M�:�NF�IB�]�z�^UG������t|m�V�k [9K<���!�U���V����$��Uգ��$�g �HU����{ ^���/���ҧ���f��͕݅��9߿��h��
�x"�{@oiܩ�@fS�����=���:Ik��qz�כ���{�u���ih �ɢ�o���[�����(A�C��+��o�r[J���ū��
7dy�:Le��r!��H��[�Qچ�R\�Y�6r��a2��*Aǩ�p�
���+���߽S+���RkEI�^�	�&9ѭ��.N������ �U�`�������89Y�>3�D���Z_]�Uq'�\S��v�.�z���$c�ހ5?�悬�O	A��Lj�t�X�˩�f?�O0u�|]� M4r��V�̗�xuJW�}
��Pe�qc��Ȉx�0Wf������~�jc��LT�xVwZ����;���2[>L�X9�o���Ra��u��V� �]qOȶ]��բf~Bϰ.��tt/�i���î�)lxfmtL���)H����DV1V�fGwN~9�]�`�  ,HUI�	rz����M��N�CNoC]��:]��O�7N�F�/������ev�B��2��'�ar}�-&�*A�^E]�p�t��V����*q s:�U�v@p�}���@�Vq(���<?%�y�{@5��I!�O�^�U��z �i��A��
�ʋ���5���� �F��gbPz��i�r���m�,���t��d(I�8[������6�9�5�/��**���5Ǝ���R��\�-���*u����M�A�l$:I���^�遾��=K�����gv���B$d+̈́j��M~�m��Ö���j
��6��O������OLP�����3�'�Sd'h:)=sY�en)�W�A����V��E ��w}х�zQ���|/`.t0����I,�dq�ހ�y���m�	'���r�(ӻ�M�	L���-߬Uҍz������R�LH16Y��A�_n��{�A��h	B��Vq���`ئ@��Rı.���v�)O����J(�=�-�
ƨ�SU��#���G�h>�C�˘�Ҝ�}-��J�;���{��'׉�z]�S�{]����(�dc���(e��7>*-l0�/N�ޅ�p�d�D�,��%S�Zo�CP/T}�`�G�0,?�WE����Tܠ_�P:�Id���٢F�K/��sL���K�w��{6����X=�,U�?�&��h}E��6�1�E׵d�6 �A2_0�W�\��[�fa��h 7s�wǴ��z��Y+m�ݯx�����[u8Uy���OD�i��z�|�lti�$BG��+���d}���Ղ��.;d>��gh|~�%�1���q%_�!�J�OΓ��#�&R�úьO{�6��&��1� �l沰�_�'�8;C)7Y��g}^2V���}t����iη\�p�U��R7F��K�n����k�z�g�\��c�,�����T붪3�j�w��*]�>C�lj���v��
K�𹸹Jْ	�R�!�k q-&�|T�|��r�����q�������/&�۔�r(���	}��Qz�����3���E�pU2�_�2	���9�(�W����裶D�`ln�+Da��S�Z3�c�		Z�R�)2;�3�,��(���<�*K�L�o�T�dq�>�阥
�η�x��ڠ#/ ��p|:a�Zq<�r]�
o�ҥ��c����|:A%sG�leZ�OX�� ���8|�ґ���w с�}���1��+�d��	���Bcu��>�[�������� |�`1��}ߟ>�������5���QɀHy�uzH���ը�rɊo�B��p����h�Tn
;f��U���_��`:�<Y{(;��Q���1J�~�>Y1 ���r,�.~��w&� �##��{�'bҲ�|0�=�ЗN/�x���I�f:xI�8��3���6}F�Ya����x��*����~dG)iK�*����y��n�i��EWo��d�>�ޏ�$B)?�-k��3���UJ��9��s#<�������t?�������3��ȌB�����֌�g4�/N�a?�r#Ё��p��Q��X��`|��YR���>ю�z�� �˨�tO���8
�P*�D���K���w�1�?袑8}�ο�};�i���ޫ��4�����C+�Μ�ߔ�<_�^���ͦQg���6����Gb~Z*EE�>�rbvp���m�2d{j���x�A�_!�x�*N�⃅B�|��
�'����_Q�{��wg'�wE�He���}�>�R"��Y8<��5� ��~o� r�`��b�W�S�	l-��jqC�%�k�"6�n��;�?ގ^aj^Q*1�R�>��r�gK7�y_�']|w 1q�����I@��W��)�g� JUvt�����8Q�ѫȑ�\Z��K�y�ge[���]�V����ܚ۶�8��|�<�3֮�4�7��lnDI/Hf�"�jV3����6ͧ_�n��ާ�c ���wnV�J�����r=y�s2��;7�i��%��1��V��@���Ǔ�r�=��;In�"����!JT�% ��gA�u+��c5��E��
q�����\h�HP��T����J���������xo�mඞ 7(aƏ7��]I�����N��a��	�pC�׼��Mx��@&-����6f�O���XV��W�"�_���"x�:<�H���胔��fTTv�ǐ 7��єw�R�	�G~	Pp���q�׾v�W�����`woN_������)k{VܬV8D�S�>N�8V$=n�9��?�ES@�f�8�U=H� 7�ꊅ[Z�e���g� ��y��H����z�
r�$��ͦ�.��T��U��`�IU"��Vo��d���u��z�X�kXB�U��hs�i랧QpР�����s�{��n �l�(M|�z:�� �	  5�S8����L7������Lf#W����2�rS�v^
��	���D�z�ډ]�����Pb���oA�E�0fu��$\p��`V@�[����
p+��6�Ev���k���Nz}' �mn�"�i'7������B�F�䀗[쁬a�*� Ond̚��?R '�%�(:�^�h`��bG��u �-��鱬�/�ْ�|гb�ܮo6�u1�W����Y_��Q�Wk=��­�]�6muFf�@��9ո��k$�J ;��j�%�3���w�=�4i�}?C"$RX�OH�@���� F�E[�>b��T�Y�me��m+X!tUkSa�}Av~�Q�)%��*��;�X�پ�i��x�P����|�t
!ph7��]��o+�� %�p{
��ő��$X��k,�2.	C-������A�S�]f:��B�7�]6��	��"&�J�s����ڼMr��|D?�CR<�`?���^�G��qG:ϴe����f���)M^ܕu�����:ø��@!��1���ql5��� �j�nI�Q�sR~z�K�/Ky.M=�-=���A'�P�C��h������Gbj�S� �����/;��?34	@��1D)N] � }�Z�Qm�L�b��`1����H��� ���pVm��P	���m$\��0�*~E���'��.
�u���ȟ`��Re�g���;Ԅ7�Vk�����[�,*q�������5j�R�츲h����s�o��ڧ��P���y7�4�dw�2�3�!@�U����z�����bk���=����_�!&* �]=3Ek�Ϲ��϶
���������?7(NC�=�	p��n�d�P2�֯n�7vg��MO����ݬ��|C�8৸Xl+�=��U-�  �N��{s@[��e��
���<��L�O�,�^�웉ش��
���&׭���_J����I(�*E>��evCv$���Yf�M8c���圥� �2+��QW�P��#Rm���\� rV�*��H7|�p? ^�قn���@�,�U��(,�V��\�o� V�vt�(�5�*ϋ�$C�eaJ�wE�tueZ�{�D�$�����g���0��YS��\� m��X�|_Fr`O�X]t�����e�O��4櫱�a�6,��e�,�a�,��f��'�WE@L$1@O�Q�@�1�iY�����8�aq��GJ����2�f6\�/���oo�Ǫ;)���=���P3|,�u�P��p�w���e�M<��FŴQ� ��}��b�x� 6V��Vu�^��:I�������K�`�O���Q�n���_ �_U�IS_�����X�'G�c~��_ucg����!!#QQ]K�F��3uGZN���	h:7� J��.�#� +��%U>�g���-ǔ�+�bt��<S5ABS�MkV��W^`�Ȳ��i��4�}����P7���XM���l�������S��nk[���&��@�,�9��af�%��	���W1 \�7�����ƈ�e� ��S(@��mn5��V�����T����]ܮ"��om'�Sya�R�g�{e�U��E.H���[�m�{	�_YR�k����,)�{��;F�&�~�������:יW��|���{#1��^�1 !�uu�S8�T�s��e��O)������a:|��=�/�e��`�U����`6N��"ځz��$TK�%W��^���hY���|Q�m2E�~$c���3��LH���� �r�����ʦ��������}x!	�$�:���!����:�8�"���qiu
9���	)瑝-����݁X��W�)�5���}Zjt��>��CS lI,hj�u�>�ջ��3����n���O�\M�H���;��|i
�-���~Y��([.��̢���>�x~�{�ʶQ��l[.���p���D[b�����x���R
r-���n͕�W�ql�@��ҖUK%��(�#����n )��pM�"#\�zbF��]ͽ�yz���|ULtv��\�]��/�)`�<-�~Z�]��nZ
�-O�*�;^�m!x�%�p�Y���)����P}��j�������:��U�Hb�3�=�N*) �\եu	4���M
~�Z/��1��0�G�K��Y ��l�)8�<5Z� �=*l� 	'Y�*{vb%���/= �a+Nf����������`�r]q)tq�i}�\��e$Fk��	�p��k�y,�#@,6E4�#I����)��,���͎�O,e^��Q�敽��Ͻ)бj�)�]
��?����Ȳ��=N�JA�u�6�.탨�ޛ���n&�)8��V����)z
�,�k7o>�;�i@�e/0��Z}�4�(�\�	$W�?�3��ݘ؂�:Ftq�;��Q�A��,���,��0�7���1dծȻ���w�؏��U't=�H�[�L�&�I	�ǲ*f=��M{�M]�����)0�G5n�ypV��xi�����jt�LA�?�/�ȏՂ��qf�����ի�Du@      �	      x������ � �      �	      x������ � �      �	   �   x�U�;�0Dk�)|�|�t���J��r6�x�w	��C���n�43�d�YnUE��8��M������#F��hCz�DQ�O=%�,����yڎ�uu2gJ=fy2�G��a��C�vq-�'��l��E���B6W��������Q�ME� �dO�     