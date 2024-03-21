import "reflect-metadata";
import { Entity, PrimaryGeneratedColumn, Column } from "typeorm";

@Entity()
export class clients { 

    @PrimaryGeneratedColumn()
    id: number;

    @Column("varchar", { length: 255 })
    nom: string;

    @Column("varchar", { length: 255 })
    prenom: string;

    @Column("varchar", { length: 255 })
    email: string;

    @Column("varchar", { length: 255 }) 
    telephone: string; 

    @Column("text") 
    adresse: string;

    @Column({ type: "timestamp", default: () => "CURRENT_TIMESTAMP" })
    dateCreation: Date;

    @Column({ type: "timestamp", default: () => "CURRENT_TIMESTAMP", onUpdate: "CURRENT_TIMESTAMP" })
    dateMiseajour: Date;
}
