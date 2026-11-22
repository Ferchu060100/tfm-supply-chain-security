# Fortificación de la Cadena de Suministro de Software

## Descripción

Prueba de concepto desarrollada como parte de un Trabajo
Fin de Máster en DevOps.

El objetivo es implementar un pipeline CI/CD que integre
mecanismos de trazabilidad, integridad y verificación de
artefactos software.

## Tecnologías previstas

- GitHub Actions
- Docker Buildx / BuildKit
- GitHub Container Registry
- Syft
- CycloneDX
- GitHub Artifact Attestations
- Cosign / Sigstore
- Kubernetes
- kind
- Sigstore Policy Controller

## Objetivos de seguridad

- Generación de SBOM.
- Generación de provenance.
- Firma criptográfica de imágenes.
- Verificación de evidencias.
- Control de admisión en Kubernetes.

## Estado

Repositorio inicial del proyecto.
Los componentes se incorporarán progresivamente.

## Referencia

SLSA v1.2 Build Level 3.
