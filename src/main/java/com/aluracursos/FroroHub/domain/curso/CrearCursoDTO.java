package com.aluracursos.FroroHub.domain.curso;


import jakarta.validation.constraints.NotNull;
import org.hibernate.validator.constraints.NotBlank;

public record CrearCursoDTO(@NotBlank String name, @NotNull Categoria categoria) {
}
