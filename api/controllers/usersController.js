'use strict';

const User = require('../models/user');

module.exports = {
    async getAll(req, res, next){
        try{
            const data = await User.getAll();
            console.log('Usuarios ' + data);
            return res.status(200).json(data);
        }catch(error){
            console.log(err);
            return res.status(501).json({
                success: false,
                message: 'Error al obtener usuarios'
            });
        }
    }
};