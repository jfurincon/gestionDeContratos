import {connect} from 'mongoose';
import {config} from 'dotenv';

config();

export const connectDB = async () => {
    try{
        const connection = await connect(`mongodb://${process.env.MONGO_HOST}:${process.env.MONGO_PORT}/${process.env.MONGO_DB}`);
        console.log(`MongoDB connected: ${connection.connection.host}`);
        return connection;
    } catch (error) {
        throw Error("ERROR " + error.message);
    }
};