import express from "express";
import foodRouter from "./food.router.js";

const rootRouter = express.Router();

rootRouter.use("/food", foodRouter);

export default rootRouter;
