<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Fjzh.aspx.cs" Inherits="hkpro.other.wj.Fjzh" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <title>���ּ��己��ת��</title>
    <script language="JavaScript">
<!--
        function copy(ob) {
            var obj = findObj(ob); if (obj) {
                obj.select(); js = obj.createTextRange(); js.execCommand("Copy");
            }
        }

        function paste(ob) {
            var obj = findObj(ob); if (obj) {
                obj.select(); js = obj.createTextRange(); js.execCommand("Paste");
            }
        }

        function cut(ob) {
            var obj = findObj(ob); if (obj) {
                obj.select(); js = obj.createTextRange(); js.execCommand("Cut");
            }
        }

        function findObj(n, d) { //v4.0
            var p, i, x; if (!d) d = document; if ((p = n.indexOf("?")) > 0 && parent.frames.length) {
                d = parent.frames[n.substring(p + 1)].document; n = n.substring(0, p);
            }
            if (!(x = d[n]) && d.all) x = d.all[n]; for (i = 0; !x && i < d.forms.length; i++) x = d.forms[i][n];
            for (i = 0; !x && d.layers && i < d.layers.length; i++) x = findObj(n, d.layers[i].document);
            if (!x && document.getElementById) x = document.getElementById(n); return x;
        }

        function charPYStr() {
            return '�������������������������������������������������������������������°ðİŰưǰȰɰʰ˰̰ͰΰϰаѰҰӰ԰հְװذٰڰ۰ܰݰް߰�������������������������������������������������������������������������������������������������������������±ñıűƱǱȱɱʱ˱̱ͱαϱбѱұӱԱձֱױرٱڱ۱ܱݱޱ߱�������������������������������������������������������������������������������������������������������������²òĲŲƲǲȲɲʲ˲̲ͲβϲвѲҲӲԲղֲײزٲڲ۲ܲݲ޲߲�������������������������������������������������������������������������������������������������������������³óĳųƳǳȳɳʳ˳̳ͳγϳгѳҳӳԳճֳ׳سٳڳ۳ܳݳ޳߳��������������������������������������������������������������������������������������������������������������´ôĴŴƴǴȴɴʴ˴̴ʹδϴдѴҴӴԴմִ״شٴڴ۴ܴݴ޴ߴ�������������������������������������������������������������������������������������������������������������µõĵŵƵǵȵɵʵ˵̵͵εϵеѵҵӵԵյֵ׵صٵڵ۵ܵݵ޵ߵ�������������������������������������������������������������������������������������������������������������¶öĶŶƶǶȶɶʶ˶̶Ͷζ϶жѶҶӶԶնֶ׶ضٶڶ۶ܶݶ޶߶�������������������������������������������������������������������������������������������������������������·÷ķŷƷǷȷɷʷ˷̷ͷηϷзѷҷӷԷշַ׷طٷڷ۷ܷݷ޷߷�������������������������������������������������������������������������������������������������������������¸øĸŸƸǸȸɸʸ˸̸͸θϸиѸҸӸԸոָ׸ظٸڸ۸ܸݸ޸߸�������������������������������������������������������������������������������������������������������������¹ùĹŹƹǹȹɹʹ˹̹͹ιϹйѹҹӹԹչֹ׹عٹڹ۹ܹݹ޹߹�������������������������������������������������������������������������������������������������������������ºúĺźƺǺȺɺʺ˺̺ͺκϺкѺҺӺԺպֺ׺غٺںۺܺݺ޺ߺ�������������������������������������������������������������������������������������������������������������»ûĻŻƻǻȻɻʻ˻̻ͻλϻлѻһӻԻջֻ׻ػٻڻۻܻݻ޻߻�������������������������������������������������������������������������������������������������������������¼üļżƼǼȼɼʼ˼̼ͼμϼмѼҼӼԼռּ׼ؼټڼۼܼݼ޼߼�������������������������������������������������������������������������������������������������������������½ýĽŽƽǽȽɽʽ˽̽ͽνϽнѽҽӽԽսֽ׽ؽٽھ����������������������������������������������������������¾þľžƾǾȾɾʾ˾̾;ξϾоѾҾӾԾվ־׾ؾپھ۾ܾݾ޾߾�����������������������۽ܽݽ޽߽�����������������������������������������������������������������������������������������������������������������������������������������¿ÿĿſƿǿȿɿʿ˿̿ͿοϿпѿҿӿԿտֿ׿ؿٿڿۿܿݿ޿߿����������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������¡¢£¤¥¦§¨©ª«¬­®¯°±²³´µ¶·¸¹º»¼½¾¿������������������������������������������������������������������������������������������������������������������������������áâãäåæçèéêëìíîïðñòóôõö÷øùúûüýþÿ������������������������������������������������������������������������������������������������������������������������������ġĢģĤĥĦħĨĩĪīĬĭĮįİıĲĳĴĵĶķĸĹĺĻļĽľĿ������������������������������������������������������������������������������������������������������������������������������šŢţŤťŦŧŨũŪūŬŭŮůŰűŲųŴŵŶŷŸŹźŻżŽžſ������������������������������������������������������������������������������������������������������������������������������ơƢƣƤƥƦƧƨƩƪƫƬƭƮƯưƱƲƳƴƵƶƷƸƹƺƻƼƽƾƿ������������������������������������������������������������������������������������������������������������������������������ǢǣǤǥǦǧǨǩǪǫǬǭǮǯǰǱǲǳǴǵǶǷǸǹǺǻǼǽǾǿ������������������������������������������������������������������������������������������������������������������������������ȡȢȣȤȥȦȧȨȩȪȫȬȭȮȯȰȱȲȳȴȵȶȷȸȹȺȻȼȽȾȿ������������������������������������������������������������������������������������������������������������������������������ɡɢɣɤɥɦɧɨɩɪɫɬɭɮɯɰɱɲɳɴɵɶɷɸɹɺɻɼɽɾɿ������������������������������������������������������������������������������������������������������������������������������ʡʢʣʤʥʦʧʨʩʪʫʬʭʮʯʰʱʲʳʴʵʶʷʸʹʺʻʼʽʾʿ������������������������������������������������������������������������������������������������������������������������������ˡˢˣˤ˥˦˧˨˩˪˫ˬ˭ˮ˯˰˱˲˳˴˵˶˷˸˹˺˻˼˽˾˿������������������������������������������������������������������������������������������������������������������������������̴̵̶̷̸̡̢̧̨̣̤̥̦̩̪̫̬̭̮̯̰̱̲̳̹̺̻̼̽̾̿������������������������������������������������������������������������������������������������������������������������������ͣͤͥͦͧͨͩͪͫͬͭͮͯ͢͡ͰͱͲͳʹ͵Ͷͷ͸͹ͺͻͼͽ;Ϳ������������������������������������������������������������������������������������������������������������������������������Ρ΢ΣΤΥΦΧΨΩΪΫάέήίΰαβγδεζηθικλμνξο������������������������������������������������������������������������������������������������������������������������������ϡϢϣϤϥϦϧϨϩϪϫϬϭϮϯϰϱϲϳϴϵ϶ϷϸϹϺϻϼϽϾϿ������������������������������������������������������������������������������������������������������������������������������СТУФХЦЧШЩЪЫЬЭЮЯабвгдежзийклмноп������������������������������������������������������������������������������������������������������������������������������ѡѢѣѤѥѦѧѨѩѪѫѬѭѮѯѰѱѲѳѴѵѶѷѸѹѺѻѼѽѾѿ������������������������������������������������������������������������������������������������������������������������������ҡҢңҤҥҦҧҨҩҪҫҬҭҮүҰұҲҳҴҵҶҷҸҹҺһҼҽҾҿ������������������������������������������������������������������������������������������������������������������������������ӡӢӣӤӥӦӧӨөӪӫӬӭӮӯӰӱӲӳӴӵӶӷӸӹӺӻӼӽӾӿ������������������������������������������������������������������������������������������������������������������������������ԡԢԣԤԥԦԧԨԩԪԫԬԭԮԯ԰ԱԲԳԴԵԶԷԸԹԺԻԼԽԾԿ������������������������������������������������������������������������������������������������������������������������������աբգդեզէըթժիլխծկհձղճմյնշոչպջռսվտ������������������������������������������������������������������������������������������������������������������������������ְֱֲֳִֵֶַָֹֺֻּֽ֢֣֤֥֦֧֪֭֮֡֨֩֫֬֯־ֿ������������������������������������������������������������������������������������������������������������������������������סעףפץצקרשת׫׬׭׮ׯװױײ׳״׵׶׷׸׹׺׻׼׽׾׿��������������������������������������������������������������������������������������������������������������������';
        }

        function ftPYStr() {
            return '���������������}���@�����K�۰��������������������������������O�\���W�ðİŰưǰȰɰʰ˰̰ͰΰϰаѰ҉ΰ��T�ְװذٔ[�۔��ݰް߰�����C���������k�O��Ͱ��򽉰������^���r����������������������󱩱��U������������݅��ؐ�^���N��v�����������������±ñıűƱǱȱɹP�˱̱ͱή����юűӱ��]�ֱױرٱڱ۱ܱݱ�߅���H���׃����q�p��˱�������e�T���l�I�e�P��������������K�������������������K�����������������g���N���a�����������������²òĲ�ؔ�ǲȲɲʲ˲̲ͅ��Q���M�K�N�nœ�}��زٲڲ۲ܲݎ��߂ȃԜy�Ӳ������������Ԍ����v���s�׋�p�P�b�U������L���L���c�S�������������n������������܇�������س��������m������ꐳ��r�ηQ�ǳȳɳʳ˳̑ͳ��\�г��G�ӳ԰V�ֳ׳��t���Y�u�X�޳߳������n�_�x�猙��ꮠ�P����I��I���h���������N���z�r�������A�������|̎�������������������������J���������N�������������������b�ôĴŴ��o�ȴ��~�˴��n���[��ҏą����ִ״ش��f�۸Z�ݴ޴ߴ��������������e���_�������������������J��������������������đ�����������Q���������hʎ�n���v�����u�\�����������I�µõĵş��ǵȵɵ����̵͵εϔ��ѵҜ�Եյֵ׵صٵڵ۵��f������c���|늵�����յ�����������{����������ՙ�B�������픶��V��ӆ�G�|�������ӗ��������������Y���������������٪��x�¶�ـ��僶Ƕȶɶʶ˶�呶Δ྄�у�ꠌ��Շ��׶��D���g�ܶݶ޶߶��Z�������艙����Z���~Ӟ�𐺶������I�����������D�����E�l�P�������y���m�����������\�C������������؜��������������������L���ŷƷǷ��w�ʷ��u�ͷΏU���M�ҷӷԷշּ����ٷڷۊ^�ݷޑ��S�S�������h�L������T�p�S���P������w������ݗ���������������������������o���������������������x�}����������ؓ��Ӈ���D�`������ԓ�ĸ��}�w�Ȏָʸ˸̸͸��s�ж����M����䓸׸ؾV���۸ܸ��V�߸����怸����R��������������w���t�����o�����������������������������������m��얹���ؕ���h���Ϲ�������ُ�򹼹����������¹ùĹ��M�ǹȹɹ�̹͹ιτ��ѹҹӹԹչֹ��P�ٹ��^���^�ޑT��؞��V���Ҏ�����w���|܉��Ԏ��𙙹��F��݁�L��偹��������^��������������񔺨�����n�����������������������������h���������������ºú�̖�ƺǺȺɺʺ˺̺ͺκϺк��u�ӺԺպ��Q�R�ٺںۺܺݺ޺ߺ��M����Z����������t������������������غ������������������o���������W�A����������Ԓ�����ѻ��Ěg�h��߀���Q�����������o�»ûĻ��S�ǻȻɻʻ˻̻ͻλϻ��e�ғ]�x�ջֻ׻ؚ��ڻۻܻݻ��V�x���Z���M�d�Lȝ���꜆�����ⷻ�@����؛���������C�����e�����������I�u���������O��݋�������������������D�׼����E���������������ļ�Ӌӛ�ȼ��H���^�o�μϊA�ѼҼ��v�a�Z��⛼ټڃr���{�ޚ��O�Լ�{�g�����D��}�O�z��A�|���캆�����p�]���b�`�vҊ�I������Ş���T�u�R�����������{�����Y�����v���u�����������z�������ɽ����q�C�e�_�ƽ���U�g�˽̽��I�^�нѽҽӽԷM���A�ؽٹ��o�����L���@�������������i�o�����R���d�������Q���������m���¾þľžƎ����f�ʾ˾̾;ξϾоѾҾ��x�վ־׾��e�ھ۾ܓ��޾߾��䏾��־愡���N���������������ۂܽݽ޽ߝ��Y�����������]�ý��������o�\�H֔�M���x�����a���M���G���X�Q�E�^�����x܊�������������E���������_�����P�����������������������������������������¿ÿ��w�ƚ��ȿɿʿ˿̿��n�ϿЉ����ӿԿտֿ׿ؓ��ڿۿܿݿ޿߿���ѝ�F�����K��~�쌒������V����r̝���h�Q�������������������������U���������Ϟ�D�����R��ه�{���ڔr�@�@�m��׎���[���|���E�������������˓Ƅ������������ӝ��՘����D�������܉�����I��������������h���x�������Y���Y��������������[�����������������r�`�������zɏ�B����z�i����Ę朑ٟ����Z�����������v������Տ�����ů������|������������������ӫC���������R���[�܄C�U�����������g�����R�`��X�I�������������s�������������@���\��¡�Ŕn�]�Ǌ䓧�t©ª�J�R�B�]�t���u̔��´µ¶·�T¹º����¾�H���X�H���Čҿ|�]�����ʞV�G�n���\���сy���Ԓ�݆�����S�]Փ�}���_߉茻j��������j���鬔�aΛ�R�R������I���u�~�}�m�z�U�M��������֙âãäåæç؈é�^ëì�Tîïðñò�Q��õö÷ø�qú�]üý�Vÿ�����������T�������������i�͉��������������i������Ғ�����܃����߾d�������侒��������������R����������������}�����Q�����և��ġĢģĤĥĦħĨĩĪīĬĭĮįİ�\ĲĳĴĵ��ķĸĹĺĻļĽľĿ�������������c���ȼ{���������������y�ғ��X���[�����H����������������M����ā������������f��������B�������m������������帔Q��ţŤ�o�~ē���rŪūŬŭŮůŰ��ŲųŴ�ZŶ�W�t��ź�Iż�ažſ�����������������������˱P�������������������������������������������r�������懊�������������������������i��������������������ơƢƣƤƥƦƧƨƩƪƫƬ�_�hƯưƱƲƳƴ�lؚƷƸƹƺ�OƼƽ�{ƿ�u�����H�����������ʓ�������������Ҙ��������V�������ۗ������ߜD������������������Ě�R�������T���M��������������������ә��Ǣ���L�T�Uǧ�w��Ǫ�tǬǭ�X�Qǰ��ǲ�\�l�qǶǷǸ����ǻǼ���N�������@���Ę��Ɔ̃S�������N���θ[�������Ӹ`�J���H�����������݌������p��A�������������Ո�c���F����������������څ�^�����|�����ȡȢ�xȤȥȦ�E��ȩȪȫȬȭȮȯ��ȱȲȳ�s�oȶ�_ȸȹȺȻȼȽȾȿ������׌���_�@�ǟ����������g���J���Ѽx�����������ؘs�������ݽq����������������������������ܛ�������J�c�����������_���w��ِ������ɢɣɤ��ɦ�}��ɩɪɫ��ɭɮɯɰ��ɲɳ��ɵɶɷ�Y��ɺɻɼɽ�hɿ���W���٠�������ȿ��ʂ����p�������������ԟ������������۽B���d��������z��������O�������������＝���򌏋����I���B���������Kʡʢʣ���}��ʧ�{ʩ��Ԋ��ʭʮʯʰ�rʲʳ�g���Rʷʸʹʺ�ʼʽʾʿ�����������ń��������m��������������ҕԇ�������؉��������ݫF�ߘ�������ݔ����������H��������������������g���������Q��������ˡˢˣˤ˥˦��˨˩˪�pˬ�lˮ˯��˱˲�˴�f�T˷�q˹˺˻˼˽˾�z��������������������Z������A�b���Ҕ\���K�������������������V�C�������m���S������q��������O�p�S�������s�����i�������������H��̣̤̥̦�Ę̩̪̫�B̭̮��؝�c����̴̵̶�TՄ̹̺̻̼̽�U̿�����������������������ˠC�͝��Ͽl����������ӑ�������v���`�������R���}�����w������������������������������l�������N�F���d �Nͣͤͥͦͧͨͩͪͫͬ͢͡�~ͮͯͰͱͲ�yʹ͵Ͷ�^͸͹�dͻ�Dͽ;�T���������ĈF���j��͑��������������Ó�r���W�E�����������ܸD�����m�����㏝�����B���������������������f�����������W������������Ρ΢Σ�f�`Φ��ΨΩ���H�SȔήί���^β��δεζηθ�jκλμ�^ξο�l���������y�Ƿ��Ɇ����̮Y��΁�u�C�����P�����׆��u���@�_�ݟoʏ���������������������]���F�����������`�������������������a��ϡϢϣϤϥϦϧϨϩϪϫϬϭ�uϯ��ϱϲ�ϴϵ϶��Ϲ�rϻϼݠϾ�{�b�M�B�ć����v�����r�w�y�t����e�������@�U�F�I�h���W�w�����޾���������������l����Ԕ����������������ʒ�����������N��������СТУФ�[ЦЧШЩЪϐЬ�f���yаб�{�C��ежзий�a�xмно�\����������������������d���������������������������ٛ����������������n�����C������̓�u����S����������������w�m܎�����������x�_ѣ�kѥѦ�WѨѩѪ��ѬѭѮԃ���ZѲѳѴӖӍ�dѸ��Ѻ�f��ѽѾѿ�����������ņ���Ӡ����鎟����}�����������������������������W�����������䏩�����V����������P������������W�B�������������u���b�G�{ҦҧҨˎҪҫҬҭҮ��ҰұҲ�Ҵ�I�~ҷҸҹҺһҼ�tҾ��������U���z�ƃx���������̏���ρ����������ˇ�������ك|�����������������㑛�x����Ԅ�h�x�g�������[���a������������y����������[ӡӢ�ы������t��Ξ�I��ωӭ�AӯӰ�fӲӳ�ѓ��ӷ�bӹӺ�xӼԁӾ�����������ă��Ƒn�����]♪q���[�������������T������������������ݛ�������~����O��������c�Z�����Z�����������n�������R�����z���uԡԢԣ�Aԥ�S�x�YԩԪԫԬԭԮ�@�@�T�AԳԴ���hԷ�ԹԺԻ�sԽ�S耎[���������y���E���\�N�j����������s���՞����d�����۔���ٝ�E�v��������嗗���������������^��؟��t���\��������ٛ��������܈��lգ��եզէը�pժ�Sլխ��կհ��ղճմ�K��ݚ��չպ��ռ��վտ�`�������ď��Ɲq���Ɏ��~��Û�������������w�����������������U�H���N���@��������������ؑᘂ������\���������걠���b��������������֢���C֥֦֧֪֭֮֨֩֫֬��ֱֲֳ��ֵֶַָֹֺֻּ��־���S�����Î������������|���̜������������R�ԽK�N�[�����\���������a���S�����䰙�敃�E���������i�T�D����T�������������������A�T�Bסעף�vץצק���u�D׫ٍ׭���f�b�yײ�Ѡ�׵�F׷٘���YՁ׼׽׾׿�������������Ɲ�Ɲ���Y�������������������ԝn������ۙ�ھC���v�u�����������������{��M�������������������������������';
        }

        function traditionalized(cc) {
            var str = '';
            for (var i = 0; i < cc.length; i++) {
                if (charPYStr().indexOf(cc.charAt(i)) != -1)
                    str += ftPYStr().charAt(charPYStr().indexOf(cc.charAt(i)));
                else
                    str += cc.charAt(i);
            }
            return str;
        }

        function simplized(cc) {
            var str = '';
            for (var i = 0; i < cc.length; i++) {
                if (ftPYStr().indexOf(cc.charAt(i)) != -1)
                    str += charPYStr().charAt(ftPYStr().indexOf(cc.charAt(i)));
                else
                    str += cc.charAt(i);
            }
            return str;
        }

        function convert(nOption) {
            if (nOption == 0)
                txt.value = simplized(txt.value);
            else
                txt.value = traditionalized(txt.value);
        }
//-->
    </script>
</head>
<body class="main">
    <table width="100%" style="height: 100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td valign="top">
                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td style="height: 30px;" align="right">
                            <input onclick="paste('txt')" type="button" value="ճ��" class="mybtn">
                            <input onclick="convert(0)" type="button" value="ת��Ϊ����" class="mybtn">
                            <input onclick="convert(1)" type="button" value="ת��Ϊ����" class="mybtn">
                            <input onclick="copy('txt')" type="button" value="����" class="mybtn">
                            <input onclick="cut('txt')" type="button" value="����" class="mybtn">
                            <input onclick="txt.value=''" type="button" value="���" class="mybtn">&nbsp;&nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <textarea id="txt" rows="15" cols="80" value=""></textarea>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>
</html>
