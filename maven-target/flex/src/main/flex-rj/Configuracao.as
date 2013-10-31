/**
 * Created with IntelliJ IDEA.
 * User: rafael
 * Date: 31/10/13
 * Time: 09:32
 * To change this template use File | Settings | File Templates.
 */
package {
import util.IConfiguracao;

public class Configuracao implements IConfiguracao{

    private static var PERFIL = "RJ";
    public function Configuracao() {
    }

    public function getRegional():String{
        return PERFIL;
    }
}
}
