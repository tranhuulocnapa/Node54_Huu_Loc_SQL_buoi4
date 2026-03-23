import { responseSuccess } from "../common/helper/response.helper.js";
import { orderService } from "../services/order.service.js";

export const orderController = {
  async order(req, res, next) {
    const result = await orderService.order(req);
    const response = responseSuccess(result, `order like successfully`);
    res.status(response.statusCode).json(response);
  },

  async getByUser(req, res, next) {
    const result = await orderService.getByUser(req);
    const response = responseSuccess(result, `getByUser like successfully`);
    res.status(response.statusCode).json(response);
  },
};
