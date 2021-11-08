import service.PersistanceService;

public class Programme {
    public static void main(String[] args) {
        PersistanceService ps = new PersistanceService();
        ps.insertClient("toto","","");
    }
}
