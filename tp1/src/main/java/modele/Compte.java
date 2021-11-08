package modele;

import jdk.jfr.Timestamp;
import lombok.*;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import java.util.Date;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class Compte{
    @Id @GeneratedValue
    private long id;
    @OneToOne
    private Client titulaire;
    private double solde;

    @Timestamp
    private Date dateOuverture;
}
