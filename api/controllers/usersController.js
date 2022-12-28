'use strict';

const User = require('../models/user');
const jwt = require('jsonwebtoken');
const keys = require('../config/keys');

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

const login = async function (req, res, next) { 
    let response;
    try {
        const email = req.body.email;
        const password = req.body.password;
        const query = await User.findByEmail(email);
        if (query.length == 0) {
            response = res.status(403).json({
                success: false,
                message: 'El correo ingresado es incorrecto.'
            });
        } else if (User.passMatch(password, query[0].password)) {
            let token = jwt.sign({ id: query[0].id, email: query[0].email }, keys.secretOrKey, {
                expiresIn: (60 * 60 * 24)// 1hora
            });

            let data = {
                id: query[0].id,
                email: query[0].email,
                namer: query[0].namer,
                lastname: query[0].lastname,
                phone: query[0].phone,
                image: query[0].image,
                session_token: `JWT ${token}`
            }

            response = res.status(200).json({
                success: true,
                message: 'El inicio de sesión ha sido exitoso.',
                data: data
            });
        } else {
            response = res.status(403).json({
                success: false,
                message: 'La contraseña ingresada es incorrecta.'
            });
        }

        
    } catch (error) {
        console.log(`Error ${error}`);
        response =  res.status(501).json({
            success: false,
            message: 'Error al iniciar sesión, intentalo nuevamente.',
            error: error
        });
    }
    
    return response;
}

module.exports = {
    getAll,
    register,
    login
};