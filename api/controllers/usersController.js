'use strict';

const User = require('../models/user');

const getAll = async function (req, res, next){
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

const register = async function (req, res, next){
    try{
        const data = req.body;
        const reg = await User.create(data);

        return res.status(200).json({
            success: true,
            message: 'El usuario ha sido creado de manera exitosa',
            data: reg
        });

    }catch(error){
        console.log(error);
        return res.status(501).json({
            success: false,
            message: 'Error al registrar usuario',
            error: error
        });
    }
}
module.exports = {
    getAll,
    register
};