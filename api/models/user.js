'use strict';

const db = require('../config/config');
const crypto = require('crypto');

const User = {};

User.getAll = () => {
    const sql = 'SELECT * FROM users';

    return db.manyOrNone(sql);
}

User.create = (user) => {
    let hashPass = crypto.createHash('sha256').update(user.password).digest('hex');
    const sql = 'INSERT INTO users (email, namer, lastname, phone, image, password, created_at, updated_at) VALUES ($1,$2,$3,$4,$5,$6,$7,$8) RETURNING id';

    return db.oneOrNone(sql, [
        user.email,
        user.namer,
        user.lastname,
        user.phone,
        user.image,
        hashPass,
        new Date(),
        new Date()
    ]);
}

module.exports = User;