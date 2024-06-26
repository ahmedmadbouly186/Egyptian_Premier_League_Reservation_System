const { User } = require("../entities/user");
const jwt = require("jsonwebtoken");
const { JWT_SECRET_KEY } = require("../config/index");
const loginService = async (data) => {
  const { username, password } = data;
  //   validate that each field is not empty
  if (!username || !password) {
    throw {
      status: 400,
      message: "All fields are required",
    };
  }
  const user = await User.findOne({ where: { username } });
  //   validate that the user exists
  if (!user) {
    throw {
      status: 400,
      message: "invalid username or password",
    };
  }
  if (user.dataValues.status !== "approved") {
    throw {
      status: 400,
      message: "wait until approved your account from adminstrator",
    };
  }
  //   validate that the password is correct
  const validPassword = password == user.dataValues.password ? true : false;
  if (!validPassword) {
    throw {
      status: 400,
      message: "invalid username or password",
    };
  }
  return {
    status: 200,
    response: {
      token: jwt.sign({ id: user.userId }, JWT_SECRET_KEY),
      user: user.dataValues,
    },
  };
};

const registerService = async (data) => {
  console.log(data);
  const {
    role,
    email,
    username,
    password,
    first_name,
    last_name,
    birth_of_date,
    gender,
    city,
    address,
  } = data;
  //   validate that each field is not empty
  if (
    !role ||
    !username ||
    !email ||
    !password ||
    !first_name ||
    !last_name ||
    !birth_of_date ||
    !gender ||
    !city
  ) {
    throw {
      status: 400,
      message: "All fields are required",
    };
  }
  //   validate that the username is unique
  const count = await User.count({ where: { username } });
  if (count > 0) {
    throw {
      status: 400,
      message: "Username is already taken",
    };
  }
  const user = await User.create({
    role,
    username,
    password,
    email,
    first_name,
    last_name,
    birth_of_date,
    gender,
    city,
    address,
    regesterAt: new Date(),
    status: "not approved",
  });
  const id = user.getDataValue("userId");
  //   create the token and return it in the response

  return {
    status: 201,
    response: {
      token: jwt.sign({ id }, JWT_SECRET_KEY),
      user: user.dataValues,
    },
  };
};

const updateUserService = async (data) => {
  console.log(data);
  const user = await User.update(data, { where: { userId: data.userId } });
  return {
    status: 200,
    response: { message: "user updated successfully", user: data },
  };
};

const getAllServices = async (data) => {
  let out = await User.findAll();
  for (let i = 0; i < data.length; i++) {
    out[i] = out[i].dataValues;
  }

  return {
    status: 200,
    response: {
      users: out,
    },
  };
};

module.exports = {
  loginService,
  registerService,
  updateUserService,
  getAllServices,
};
