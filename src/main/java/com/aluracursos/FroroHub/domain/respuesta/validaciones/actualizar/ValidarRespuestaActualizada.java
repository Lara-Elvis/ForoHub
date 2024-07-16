package com.aluracursos.FroroHub.domain.respuesta.validaciones.actualizar;

import com.aluracursos.FroroHub.domain.respuesta.ActualizarRespuestaDTO;

public interface ValidarRespuestaActualizada {

    public void validate(ActualizarRespuestaDTO data, Long respuestaId);

}
