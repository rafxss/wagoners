BBVouchers

Nuestras intención es crear una plataforma donde clientes como no clientes de BBVA tengan una experiencia en sus compras que vaya un paso más allá. Los usuarios podrán acceder a diferentes ofertas geolocalizadas dependiendo del rango en el que se encuentren, los diferenciamos como Bronce, aquellos que todavía no son clientes de BBVA y no podrán acceder a todas las ofertas, solo a aquellas en las que el objetivo final de la oferta implique convertirse en un nuevo cliente de BBVA. Por otro lado encontramos los usuarios Silver y Gold, diferenciándoos entre ellos en el que el Gold es considerado para BBVA como un cliente con prestamos preconcebidos y el Silver no.

Nuestra idea es tanto notificar a los usuarios de ofertas dentro de un radio de su ubicación que ellos especifiquen, como ofrecer una lista de ofertas cercanas para los usuarios. Destacamos que para los usuarios Bronce, los cuales no son clientes de BBVA queremos ofrecerles una experiencia que vaya un paso más allá, en la que deberán estar pendientes de la plataforma donde les saltaran distintos eventos en forma de ofertas, en las que tendrán un gran descuento (por ejemplo un cashback de una compra que se devuelva el dinero en una cuenta BBVA y por ello tengan que convertirse en clientes BBVA).

Hemos estructurado nuestra aplicación en varias tablas. La primera corresponde a los usuarios, la segunda es una tabla conectora de usuarios y ofertas y por último tenemos otras dos tablas que constan de filiales de un partner (branch_office) y la otra los principales partners.
Por otro lado, junto al framework Ruby on Rails hemos desarrollado una estructura de MVC en la que tenemos los modelos de todas las tablas, los controles de estas mismas tablas que nos permiten crear, leer, actualizar y borrar información de cada una de las tablas anteriormente mencionadas.
En cuanto a la estructura y los componentes que hemos usado, desarrollamos en Figma una guía de estilo a seguir, con el objetivo de que nuestra plataforma fuese lo más coherente y accesible posible.  Destacamos que nuestra aplicacción esta desarollada solo para telefonos moviles.

Finalmente, pushearemos todo a Heroku como nuestro server. (https://bbvouchers.herokuapp.com/)

Os dejamos el vídeo con la presentación del proyect. (https://youtu.be/InMUVQvu13U)
