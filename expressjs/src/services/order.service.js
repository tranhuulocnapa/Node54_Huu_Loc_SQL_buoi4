import { prisma } from "../common/prisma/generated/connect.prisma.js";

export const orderService = {
  async order(req) {
    const body = req.body;
    const { user_id, food_id, amount, code, arr_sub_id } = body;

    await prisma.order.create({
      data: {
        user_id: Number(user_id),
        food_id: Number(food_id),
        amount: Number(amount),
        code: code,
        arr_sub_id: arr_sub_id,
      },
    });

    return true;
  },

  async getByUser(req) {
    const params = req.params;
    const { user_id } = params;
    const orderUser = await prisma.order.findMany({
      where: { user_id: Number(user_id) },
    });

    return orderUser;
  },
};
