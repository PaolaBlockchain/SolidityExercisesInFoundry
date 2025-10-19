# Solidity Exercises in Foundry 🎯

Este repositorio contiene ejercicios prácticos de Solidity para aprender y practicar conceptos de desarrollo blockchain. Construido con **Foundry** framework para compilación, testing y deployment.

## 🚀 Inicio Rápido

### Prerequisitos
- [Foundry](https://book.getfoundry.sh/getting-started/installation)
- Git

### Instalación
```bash
git clone https://github.com/PaolaBlockchain/SolidityExercisesInFoundry.git
cd SolidityExercisesInFoundry
forge install
```

### Running Tests
```bash
# Run all tests
forge test

# Run tests with verbose output
forge test -vv

# Run specific contract tests
forge test --match-contract ContractName -vv
```

## 📁 Estructura del Proyecto

```
SolidityExercisesInFoundry/
├── src/                          # Contratos inteligentes
│   ├── Counter.sol              # Contador básico
│   └── ComplexMappingDataStructureExample5.sol  # Mapping complejo con structs
├── test/                         # Archivos de prueba
│   ├── Counter.t.sol            # Tests del contador
│   └── ComplexMappingTest.t.sol # Tests del mapping complejo
├── script/                       # Scripts de deployment
│   └── Counter.s.sol            # Script de deployment del contador
├── lib/                          # Dependencias (forge-std)
├── cache/                        # Cache de compilación
├── foundry.toml                  # Configuración de Foundry
└── README.md                     # Este archivo
```

## 📋 Contratos Inteligentes

### 1. **Counter.sol** 🔢
Un contrato contador simple para conceptos básicos de Solidity.

**Características:**
- Funcionalidad de incremento
- Almacenamiento y recuperación de números
- Gestión básica de estado

**Funciones:**
- `setNumber(uint256 newNumber)` - Establece un número específico
- `increment()` - Incrementa el contador en 1
- `number()` - Variable pública que almacena el número actual

**Conceptos de Aprendizaje:**
- Variables de estado (`uint256 public number`)
- Visibilidad de funciones (`public`)
- Operaciones básicas (`++`)

---

### 2. **PracticandoMappingComplejo** (ComplexMappingDataStructureExample5.sol) 👥
Contrato avanzado que demuestra estructuras de mapping complejas con tipos de datos personalizados.

**Características:**
- Mapea direcciones de Ethereum a structs `Person`
- Almacena datos personales (ID, nombre, edad)
- Recuperación de datos basada en dirección

**Struct Person:**
```solidity
struct Person {
    uint256 id;
    string name;
    uint8 age;
}
```

**Funciones:**
- `assignPerson(uint256 _id, string memory _name, uint8 _age)` - Asigna una persona a la dirección del caller
- `getSubject()` - Retorna los datos de la persona asociada al caller
- `subjects(address)` - Mapping público para acceso directo

**Conceptos de Aprendizaje:**
- Mappings complejos (`mapping(address => struct)`)
- Definición de structs personalizados
- Uso de `msg.sender`
- Diferencia entre `memory` y `storage`
- Documentación NatSpec

---

## 🧪 Testing Comprehensivo

Cada contrato incluye cobertura completa de pruebas:

### Tests del Counter (`Counter.t.sol`)
- ✅ `test_Increment()` - Funcionalidad básica de incremento
- ✅ `testFuzz_SetNumber(uint256 x)` - Fuzz testing para establecer números
- ✅ Verificación de estado

### Tests del Mapping Complejo (`ComplexMappingTest.t.sol`)
- ✅ `test_AssignPersonBasic()` - Asignación básica de persona
- ✅ `test_GetSubjectAfterAssignment()` - Recuperación después de asignación
- ✅ `test_MultipleUsersCanHaveDifferentData()` - Aislamiento de datos entre usuarios
- ✅ `test_OverwriteExistingPersonData()` - Sobrescritura de datos existentes
- ✅ `test_GetSubjectWithoutAssignment()` - Comportamiento sin asignación previa
- ✅ `test_AssignPersonWithEmptyName()` - Casos edge con nombre vacío
- ✅ `test_AssignPersonWithZeroAge()` - Casos edge con edad cero
- ✅ `test_AssignPersonWithMaxAge()` - Casos edge con edad máxima (255)
- ✅ `testFuzz_AssignPersonWithRandomData()` - Fuzz testing con datos aleatorios
- ✅ `test_GetSubjectConsistentWithMapping()` - Consistencia entre función y mapping directo

## 🛠 Comandos de Desarrollo

```bash
# Compilar contratos
forge build

# Ejecutar todas las pruebas
forge test

# Ejecutar pruebas con salida verbosa
forge test -vv

# Ejecutar pruebas con reporte de gas
forge test --gas-report

# Ejecutar archivo de prueba específico
forge test test/Counter.t.sol -vv
forge test test/ComplexMappingTest.t.sol -vv

# Ejecutar pruebas que coincidan con un patrón
forge test --match-contract CounterTest -vv

# Formatear código
forge fmt

# Verificar tamaño de contratos
forge build --sizes

# Limpiar cache y artifacts
forge clean
```

## 📚 Objetivos de Aprendizaje

Este repositorio cubre:

- **Sintaxis Básica de Solidity**: Variables, funciones, modificadores
- **Estructuras de Datos**: Arrays, mappings, structs
- **Control de Acceso**: Visibilidad de funciones, `msg.sender`
- **Testing Avanzado**: Unit tests, fuzz testing, casos edge
- **Herramientas de Desarrollo**: Ecosistema Foundry
- **Best Practices**: Documentación NatSpec, formateo de código
- **Gestión de Estado**: Variables públicas y privadas
- **Tipos de Datos**: uint256, uint8, string, address

## 🔧 Configuración

El proyecto usa Foundry con la configuración estándar en `foundry.toml`:
- Directorio fuente: `src`
- Directorio de salida: `out`
- Librerías: `lib` (forge-std incluido)
- Versión Solidity: `^0.8.13` (Counter) y `>=0.8.0 <0.9.0` (Mapping)

## 🎯 Casos de Uso Prácticos

### Counter Contract
- Contadores de votos en DAOs
- Sistemas de puntuación
- Contadores de eventos on-chain

### Complex Mapping Contract
- Sistemas de identidad descentralizada
- Registros de usuarios
- Bases de datos on-chain
- Sistemas de reputación

## 📝 Notas Importantes

- **Licencias**: Counter.sol usa UNLICENSED, ComplexMapping usa MIT
- **Documentación**: Contratos documentados con comentarios NatSpec
- **Convenciones**: Tests siguen las convenciones de Foundry
- **Formateo**: Código formateado con `forge fmt`
- **Seguridad**: Contratos diseñados para aprendizaje, no para producción

## 🚀 Scripts de Deployment

El proyecto incluye scripts de deployment listos para usar:

```bash
# Deploy Counter contract
forge script script/Counter.s.sol --rpc-url <RPC_URL> --private-key <PRIVATE_KEY>

# Deploy en testnet local (Anvil)
anvil  # En una terminal separada
forge script script/Counter.s.sol --rpc-url http://localhost:8545 --private-key <ANVIL_PRIVATE_KEY> --broadcast
```

## 🔍 Análisis de Gas

Para optimizar costos de gas:

```bash
# Reporte detallado de gas
forge test --gas-report

# Información de tamaño de contratos
forge build --sizes
```

## 🤝 Contribuir

1. Fork el repositorio
2. Crea una rama de feature (`git checkout -b feature/nueva-funcionalidad`)
3. Agrega tus contratos y tests
4. Asegúrate que todas las pruebas pasen (`forge test`)
5. Formatea el código (`forge fmt`)
6. Commit tus cambios (`git commit -am 'Add: nueva funcionalidad'`)
7. Push a la rama (`git push origin feature/nueva-funcionalidad`)
8. Abre un Pull Request

## 📊 Estado del Proyecto

![Tests Status](https://img.shields.io/badge/tests-passing-brightgreen)
![Coverage](https://img.shields.io/badge/coverage-100%25-brightgreen)
![Solidity](https://img.shields.io/badge/solidity-^0.8.13-blue)
![Foundry](https://img.shields.io/badge/foundry-latest-orange)

---

**¡Feliz Aprendizaje en Solidity! 🎉**

*Desarrollado con ❤️ por [PaolaBlockchain](https://github.com/PaolaBlockchain)*