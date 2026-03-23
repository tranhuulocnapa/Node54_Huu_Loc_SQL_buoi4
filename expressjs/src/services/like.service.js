import { prisma } from "../common/prisma/generated/connect.prisma.js";

export const likeService = {
  async like(req) {
    const body = req.body;
    const { user_id, res_id } = body;

    const existing = await prisma.like_res.findFirst({
      where: { user_id: Number(user_id), res_id: Number(res_id) },
    });

    if (existing) {
      await prisma.like_res.deleteMany({
        where: { user_id: Number(user_id), res_id: Number(res_id) },
      });
      return { message: "unliked" };
    }

    await prisma.like_res.create({
      data: {
        user_id: Number(user_id),
        res_id: Number(res_id),
        date_like: new Date(),
      },
    });

    return true;
  },

  async getByRestaurant(req) {
    const body = req.params;
    const { res_id } = body;
    const likeRes = await prisma.like_res.findMany({
      where: { res_id: Number(res_id) },
    });

    return likeRes;
  },

  async getByUser(req) {
    const body = req.params;
    const { user_id } = body;
    const likeUser = await prisma.like_res.findMany({
      where: { user_id: Number(user_id) },
    });

    return likeUser;
  },
};
