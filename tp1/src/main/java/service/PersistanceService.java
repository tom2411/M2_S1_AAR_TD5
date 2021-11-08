package service;

import modele.Client;

import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;

public class PersistanceService {
    private static final String PERSISTANCE_ENGINE_UNIT_NAME = "banquePU";
    private EntityManagerFactory emf;

    public PersistanceService() {
        emf = Persistence.createEntityManagerFactory(PERSISTANCE_ENGINE_UNIT_NAME);
    }


    public Client insertClient(String prenom, String nom, String adresse) {
        var entityManager = emf.createEntityManager();
        EntityTransaction tx = entityManager.getTransaction();

        try {
            tx.begin();
            Client c0 = new Client();
            c0.setNom(nom);
            c0.setPrenom(prenom);
            c0.setAdresse(adresse);
            entityManager.persist(c0);
            tx.commit();
            return c0;
        }
        catch (Exception e) {
            /* rien de bien important :) */
            e.printStackTrace();
            tx.rollback();
        }
        finally {
            entityManager.close();
        }

        return null;
    }
}
