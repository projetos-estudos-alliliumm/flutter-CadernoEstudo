function tempo(request, response){
//Pedido: request
//Responda: response

    const dynamicDate = new Date();

    response.json({
        date: dynamicDate.toGMTString()
    });

}

export default tempo;