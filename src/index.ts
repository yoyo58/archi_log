import "reflect-metadata";
import { AppDataSource } from "./data-source";
import { clients } from "./entity/clients"; // Assumant que la classe a été renommée en 'Client'

AppDataSource.initialize().then(async () => {
    console.log("Inserting a new user into the database...");
    const user = new clients(); 
    user.nom = "Timber";
    user.prenom = "Saw";
    user.email = "youssef@gmail.com";
    user.telephone = "1234567890"; 
    user.adresse = "mondelange 57300";
    user.dateCreation = new Date('2024-02-17T01:00:00.000Z');
    user.dateMiseajour = new Date('2024-03-17T01:00:00.000Z');


    await AppDataSource.manager.save(user);
    console.log("Saved a new user with id: " + user.id);

    console.log("Loading users from the database...");
    const users = await AppDataSource.manager.find(clients); // Utilisation de 'Client' si la classe a été renommée
    console.log("Loaded users: ", users);

    console.log("Here you can setup and run express / fastify / any other framework.");
}).catch(error => console.log(error));
