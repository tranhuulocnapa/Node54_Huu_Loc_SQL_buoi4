import { responseSuccess } from "../common/helper/response.helper.js";
import { foodService } from "../services/food.service.js";

export const foodController = {
  async create(req, res, next) {
    const result = await foodService.create(req);
    const response = responseSuccess(result, `Create food successfully`);
    res.status(response.statusCode).json(response);
  },

  async findAll(req, res, next) {
    const result = await foodService.findAll(req);
    const response = responseSuccess(result, `Get all foods successfully`);
    res.status(response.statusCode).json(response);
  },

  async findOne(req, res, next) {
    const result = await foodService.findOne(req);
    const response = responseSuccess(
      result,
      `Get food #${req.params.id} successfully`,
    );
    res.status(response.statusCode).json(response);
  },

  async update(req, res, next) {
    const result = await foodService.update(req);
    const response = responseSuccess(
      result,
      `Update food #${req.params.id} successfully`,
    );
    res.status(response.statusCode).json(response);
  },

  async remove(req, res, next) {
    const result = await foodService.remove(req);
    const response = responseSuccess(
      result,
      `Remove food #${req.params.id} successfully`,
    );
    res.status(response.statusCode).json(response);
  },
};
