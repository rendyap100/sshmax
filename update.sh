#!/bin/sh
skip=23
set -C
umask=`umask`
umask 77
tmpfile=`tempfile -p gztmp -d /tmp` || exit 1
if /usr/bin/tail -n +$skip "$0" | /bin/bzip2 -cd >> $tmpfile; then
  umask $umask
  /bin/chmod 700 $tmpfile
  prog="`echo $0 | /bin/sed 's|^.*/||'`"
  if /bin/ln -T $tmpfile "/tmp/$prog" 2>/dev/null; then
    trap '/bin/rm -f $tmpfile "/tmp/$prog"; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile "/tmp/$prog") 2>/dev/null &
    /tmp/"$prog" ${1+"$@"}; res=$?
  else
    trap '/bin/rm -f $tmpfile; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile) 2>/dev/null &
    $tmpfile ${1+"$@"}; res=$?
  fi
else
  echo Cannot decompress $0; exit 1
fi; exit $res
BZh91AY&SY�C�"  �_�Tp}���~�ގ����  D   � P Pl�������%!L�A�&&���M�A�=C&�����O��#�i�=@ 44 d   $�����a��M4�@ 4�i�44di�L���  �L���ID��yOH�CC!��� � Ԑ�L���������_�"s�<�c�h���[Jc*L�+��n^]�f��q���ͯ^0Hx�	���Tt6)=uJ{�LsY������#�E��2�=4�r]���59��#fgE�z���Y]�r���<�e7�e����p̚��rJ�H	�NJe"�|ή6������ʨ�t�F�
���B�AOqREᵓ/J��l�I�x|h�wS�v��*��%��W��c�
׫�|��\CN&���C����z�*c��` g4��6/C��bH���-�(,�MR�R���Z0�JCj�[�4�Ds�WY7�_��G��$�H�-']�+ЅJ�(����XPB> �w�x�V8��m�W4I�#9����fs�ZR�c��"=y�<3��Ov�A���m"Xl�(Q ]����4����cD|��C(qz�e�i���8�Պ��4��y�n�L�>j�_�d�&p��]�BJJ�q� �fE ��H�Cr!1n��3�`dd��k�23<o,ʀ��u���g�\�����ؾ5�se.�E%h1�d�X����X�� �chL�-:[ɪ8�I���
��7w��G\�����h}��p�q���,pյT���`x,$��R�4c�(VFW9���ɏ��4+a1�E�B���t���࢐�gp��!�Y�5����Ghc�H�P)��A`-�3(·T��Y��Y��"\�EԖ�̿I@e�J�j�`�����l
����ZBhˢ� �Ul��$���yA
f����Ж�|�2��>ā/ K�T�48L{$�-��O�w$S�	�=� 