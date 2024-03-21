import "reflect-metadata"
import { DataSource, Entity } from "typeorm"
import { clients } from "./entity/clients"

export const AppDataSource = new DataSource({
    type: "mysql",
    host: "devbdd.iutmetz.univ-lorraine.fr",
    port: 3306,
    username: "moussai11u_appli",
    password: "32205853",
    database: "moussai11u_product",
    synchronize: true,
    logging: false,
    entities: [clients],
    migrations: [],
    subscribers: [],
})

AppDataSource.initialize()
    .then(() => {
        // here you can start to work with your database
    })
    .catch((error) => console.log(error))


