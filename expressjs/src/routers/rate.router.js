import express from "express";
import { rateController } from "../controllers/rate.controller.js";

const rateRouter = express.Router();

// Tạo route CRUD
rateRouter.post("/", rateController.rate);

rateRouter.get("/restaurant/:res_id", rateController.getByRestaurant);
rateRouter.get("/user/:user_id", rateController.getByUser);

export default rateRouter;
