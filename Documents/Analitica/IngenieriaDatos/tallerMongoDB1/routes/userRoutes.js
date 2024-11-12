import express from "express";
import {createUser, getUsersN, getUsers30, updateUser, updateUser30, deleteUser, getUsers, deleteUser30} from "../controller/userController.js";
const router = express.Router();

router.post('/users', createUser);
router.get('/users', getUsers); // get all users
router.get('/users/name/:name', getUsersN); // get users by name
router.get('/users30', getUsers30); // route to get users with 30 years old or older
router.put('/users/id/:id', updateUser); // update user by id
router.put('/users30', updateUser30); // route to update users with a new field true/false
router.delete('/users/name/:name', deleteUser); // delete user by name
router.delete('/users30', deleteUser30); // route to delete users with less than 30 years old

export default router;
