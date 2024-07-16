package com.aluracursos.FroroHub.domain.respuesta.validaciones.actualizar;

import com.aluracursos.FroroHub.domain.respuesta.ActualizarRespuestaDTO;
import com.aluracursos.FroroHub.domain.respuesta.Respuesta;
import com.aluracursos.FroroHub.domain.respuesta.RespuestaRepository;
import com.aluracursos.FroroHub.domain.topico.Estado;
import com.aluracursos.FroroHub.domain.topico.TopicoRepository;
import jakarta.validation.ValidationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class SolucionDuplicada implements ValidarRespuestaActualizada{

    @Autowired
    private RespuestaRepository respuestaRepository;

    @Autowired
    private TopicoRepository topicoRepository;

    @Override
    public void validate(ActualizarRespuestaDTO data, Long respuestaId) {
       if (data.solucion()){
           Respuesta respuesta = respuestaRepository.getReferenceById(respuestaId);
           var topicoResuelto = topicoRepository.getReferenceById(respuesta.getTopico().getId());
           if (topicoResuelto.getEstado() == Estado.CLOSED){
               throw new ValidationException("Este topico ya esta solucionado.");
           }
       }
    }
}


