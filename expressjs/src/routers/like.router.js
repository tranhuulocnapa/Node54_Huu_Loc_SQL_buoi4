import express from "express";
import { likeController } from "../controllers/like.controll.js";

const likeRouter = express.Router();

// Tạo route CRUD
likeRouter.post("/", likeController.like);

likeRouter.get("/restaurant/:res_id", likeController.getByRestaurant);
likeRouter.get("/user/:user_id", likeController.getByUser);

export default likeRouter;
