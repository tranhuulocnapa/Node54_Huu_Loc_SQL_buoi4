import { prisma } from "../common/prisma/generated/connect.prisma.js";

export const foodService = {
  async create(req) {
    return `This action create`;
  },

  async findAll(req) {
    return `This action returns all food`;
  },

  async findOne(req) {
    return `This action returns a id: ${req.params.id} food`;
  },

  async update(req) {
    return `This action updates a id: ${req.params.id} food`;
  },

  async remove(req) {
    return `This action removes a id: ${req.params.id} food`;
  },
};
