class User {
  int? id;
  int? rolId;
  String? email;
  String? password;
  DatosPersonales? datosPersonales;
  int? datosPersonalesId;
  String? createdAt;
  String? updatedAt;
  Roles? rol;
  Equipos? equipo;
  int? equipoId;

  User({
    this.id,
    this.equipo,
    this.equipoId,
    this.password,
    this.rolId,
    this.email,
    this.datosPersonales,
    this.datosPersonalesId,
    this.createdAt,
    this.updatedAt,
    this.rol,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    equipoId = json['equipoId'];
    rolId = json['rolId'];
    email = json['email'];
    password = json['password'];
    datosPersonales = json['datosPersonales'] != null
        ? DatosPersonales.fromJson(json['datosPersonales'])
        : null;
    equipo = json['equipos'] != null ? Equipos.fromJson(json['equipos']) : null;
    rol = json['rol'] != null ? Roles.fromJson(json['rol']) : null;
    datosPersonalesId = json['datosPersonalesId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['equipoId'] = equipoId;
    data['rolId'] = rolId;
    data['email'] = email;
    data['password'] = password;
    if (datosPersonales != null) {
      data['datosPersonales'] = datosPersonales!.toJson();
    }
    if (equipo != null) {
      data['equipos'] = equipo!.toJson();
    }
    if (rol != null) {
      data['rol'] = rol!.toJson();
    }
    data['datosPersonalesId'] = datosPersonalesId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

class DatosPersonales {
  int? id;
  String? nombre;
  String? apellidoPaterno;
  String? apellidoMaterno;
  Direccion? direccion;
  int? direccionId;
  String? createdAt;
  String? updatedAt;

  DatosPersonales({
    this.id,
    this.nombre,
    this.apellidoPaterno,
    this.apellidoMaterno,
    this.direccion,
    this.direccionId,
    this.createdAt,
    this.updatedAt,
  });

  DatosPersonales.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nombre = json['nombre'];
    apellidoPaterno = json['apellidoPaterno'];
    apellidoMaterno = json['apellidoMaterno'];
    direccion = json['direccion'] != null
        ? Direccion.fromJson(json['direccion'])
        : null;
    direccionId = json['direccionId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['nombre'] = nombre;
    data['apellidoPaterno'] = apellidoPaterno;
    data['apellidoMaterno'] = apellidoMaterno;
    if (direccion != null) {
      data['direccion'] = direccion!.toJson();
    }
    data['direccionId'] = direccionId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

class Direccion {
  int? id;
  String? calle;
  String? colonia;
  String? codigoPostal;
  String? municipio;
  String? estado;
  String? pais;
  Ubicacion? ubicacion;
  int? ubicacionId;
  String? createdAt;
  String? updatedAt;

  Direccion({
    this.id,
    this.calle,
    this.colonia,
    this.codigoPostal,
    this.municipio,
    this.estado,
    this.pais,
    this.ubicacion,
    this.ubicacionId,
    this.createdAt,
    this.updatedAt,
  });

  Direccion.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    calle = json['calle'];
    colonia = json['colonia'];
    codigoPostal = json['codigoPostal'];
    municipio = json['municipio'];
    estado = json['estado'];
    pais = json['pais'];
    ubicacion = json['ubicacion'] != null
        ? Ubicacion.fromJson(json['ubicacion'])
        : null;
    ubicacionId = json['ubicacionId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['calle'] = calle;
    data['colonia'] = colonia;
    data['codigoPostal'] = codigoPostal;
    data['municipio'] = municipio;
    data['estado'] = estado;
    data['pais'] = pais;
    if (ubicacion != null) {
      data['ubicacion'] = ubicacion!.toJson();
    }
    data['ubicacionId'] = ubicacionId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

class Ubicacion {
  int? id;
  double? latitud;
  double? longitud;
  String? createdAt;
  String? updatedAt;

  Ubicacion({
    this.id,
    this.latitud,
    this.longitud,
    this.createdAt,
    this.updatedAt,
  });

  Ubicacion.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    latitud = (json['latitud'] as num?)?.toDouble();
    longitud = (json['longitud'] as num?)?.toDouble();
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['latitud'] = latitud;
    data['longitud'] = longitud;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

class Roles {
  int? id;
  String? name;
  String? color;
  String? createdAt;
  String? updatedAt;

  Roles({
    this.id,
    this.name,
    this.color,
    this.createdAt,
    this.updatedAt,
  });

  Roles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    color = json['color'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['color'] = color;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

class Equipos {
  int? id;
  int? posicion;
  String? nombre;
  int? personasMinimas;
  String? createdAt;
  String? updatedAt;
  DetallesEquipos? detalleEquipo;

  Equipos({
    this.id,
    this.posicion,
    this.nombre,
    this.personasMinimas,
    this.createdAt,
    this.updatedAt,
    this.detalleEquipo,
  });

  Equipos.fromJson(Map<String, dynamic> json) {
    if (json['id'] != null) {
      id = json['id'];
    }
    if (json['posicion'] != null) {
      posicion = json['posicion'];
    }
    if (json['nombre'] != null) {
      nombre = json['nombre'];
    }
    if (json['personasMinimas'] != null) {
      personasMinimas = json['personasMinimas'];
    }
    if (json['createdAt'] != null) {
      createdAt = json['createdAt'];
    }
    if (json['updatedAt'] != null) {
      updatedAt = json['updatedAt'];
    }
    detalleEquipo = json['detallesEquipo'] != null
        ? DetallesEquipos.fromJson(json['detallesEquipo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (id != null) {
      data['id'] = id;
    }
    if (id != null) {
      data['posicion'] = posicion;
    }
    if (id != null) {
      data['name'] = nombre;
    }
    if (id != null) {
      data['personasMinimas'] = personasMinimas;
    }
    if (id != null) {
      data['createdAt'] = createdAt;
    }
    if (id != null) {
      data['updatedAt'] = updatedAt;
    }
    if (detalleEquipo != null) {
      data['detallesEquipo'] = detalleEquipo!.toJson();
    }
    return data;
  }
}

class DetallesEquipos {
  int? id;
  String? logo;
  String? portada;
  String? descripcion;
  String? createdAt;
  String? updatedAt;
  int? puntos;

  DetallesEquipos(
      {this.id,
      this.logo,
      this.portada,
      this.descripcion,
      this.createdAt,
      this.updatedAt,
      this.puntos});

  DetallesEquipos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    puntos = json['puntos'];
    logo = json['logo'];
    portada = json['portada'];
    descripcion = json['descripcion'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['puntos'] = puntos;
    data['logo'] = logo;
    data['portada'] = portada;
    data['descripcion'] = descripcion;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
