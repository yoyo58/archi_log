import "reflect-metadata";
import { Entity, PrimaryGeneratedColumn, Column } from "typeorm";

@Entity()
export class clients { // La convention pour les noms de classe est d'utiliser la majuscule pour la première lettre et au singulier

    @PrimaryGeneratedColumn()
    id: number;

    @Column("varchar", { length: 255 })
    nom: string;

    @Column("varchar", { length: 255 })
    prenom: string;

    @Column("varchar", { length: 255 })
    email: string;

    @Column("varchar", { length: 255 }) // Précisez le type de colonne si ce n'est pas 'varchar'
    telephone: string; // Le type pour le téléphone devrait probablement être 'string' pour inclure des formats divers

    @Column("text") // Si l'adresse peut être longue, 'text' est plus approprié que 'varchar'
    adresse: string;

    @Column({ type: "timestamp", default: () => "CURRENT_TIMESTAMP" })
    dateCreation: Date;

    @Column({ type: "timestamp", default: () => "CURRENT_TIMESTAMP", onUpdate: "CURRENT_TIMESTAMP" })
    dateMiseajour: Date;
}
