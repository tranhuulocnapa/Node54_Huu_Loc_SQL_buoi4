import { prisma } from "../common/prisma/generated/connect.prisma.js";

export const rateService = {
  async rate(req) {
    const body = req.body;
    const { user_id, res_id, amount } = body;
    console.log({ user_id, res_id, amount });
    // const rating = Number(amount);
    // await prisma.rate_res.upsert({
    //   where: {
    //     user_id_res_id: {
    //       user_id: Number(user_id),
    //       res_id: Number(res_id),
    //     },
    //   },
    //   update: { rating },
    //   create: { user_id: Number(user_id), res_id: Number(res_id), rating },
    // });
    const existing = await prisma.rate_res.findFirst({
      where: { user_id: Number(user_id), res_id: Number(res_id) },
    });

    if (existing) {
      await prisma.rate_res.update({
        where: { id: existing.id },
        data: { amount: Number(amount), date_res: new Date() },
      });
      return true;
    }

    await prisma.rate_res.create({
      data: {
        user_id: Number(user_id),
        res_id: Number(res_id),
        amount: Number(amount),
        date_res: new Date(),
      },
    });

    return true;
  },

  async getByRestaurant(req) {
    const params = req.params;
    const { res_id } = params;
    const rateRes = await prisma.rate_res.findMany({
      where: { res_id: Number(res_id) },
    });

    return rateRes;
  },

  async getByUser(req) {
    const params = req.params;
    const { user_id } = params;
    const rateUser = await prisma.rate_res.findMany({
      where: { user_id: Number(user_id) },
    });

    return rateUser;
  },
};
