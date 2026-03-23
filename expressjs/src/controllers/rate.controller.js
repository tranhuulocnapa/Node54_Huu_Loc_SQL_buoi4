import { responseSuccess } from "../common/helper/response.helper.js";
import { rateService } from "../services/rate.service.js";

export const rateController = {
  async rate(req, res, next) {
    const result = await rateService.rate(req);
    const response = responseSuccess(result, `rate like successfully`);
    res.status(response.statusCode).json(response);
  },

  async getByRestaurant(req, res, next) {
    const result = await rateService.getByRestaurant(req);
    const response = responseSuccess(result, `getByRestaurant like`);
    res.status(response.statusCode).json(response);
  },

  async getByUser(req, res, next) {
    const result = await rateService.getByUser(req);
    const response = responseSuccess(result, `getByUser like successfully`);
    res.status(response.statusCode).json(response);
  },
};
