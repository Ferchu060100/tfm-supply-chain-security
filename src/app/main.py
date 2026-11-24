from fastapi import FastAPI

app = FastAPI(
    title="TFM Supply Chain Security API",
    description="API de demostración para el proyecto de seguridad de la cadena de suministro",
    version="1.0.0"
)


@app.get("/", tags=["general"])
async def root():
    return {
        "application": "tfm-supply-chain-security",
        "status": "running"
    }


@app.get("/health", tags=["health"])
async def health():
    return {
        "status": "ok"
    }
