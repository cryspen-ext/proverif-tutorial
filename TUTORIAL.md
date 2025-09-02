# Verifying Cryptographic Protocols with ProVerif

This folder contains materials for a tutorial workshop on using the formal protocol verifier ProVerif to analyze cryptographic protocols.
The workshop is aimed at cryptographic engineers with some knowledge of cryptographic protocols and some experience in implementing and/or analyzing them.
We will primarily learn by hands-on use of the ProVerif tool.

## Tool Installation

The [readme](./README.md) contains instructions for installing ProVerif via docker or locally.

## Additional Reading Material

The workshop will be self-contained but curious attendees who want to go deeper may be interested in the following:

* ProVerif website: [proverif.inria.fr](https://proverif.inria.fr)
* ProVerif user manual: [PDF](https://bblanche.gitlabpages.inria.fr/proverif//manual.pdf)
* An overview of how ProVerif works and how it is used: [PDF](https://bblanche.gitlabpages.inria.fr/proverif//publications/BlanchetFnTPS16.pdf)

## Tutorial Program

### Day 1

* Introduction to ProVerif [1h]
  - A term algebra to model cryptographic algorithms
  - A process calculus to model cryptographic protocols
  - Modeling cryptographic protocols in ProVerif 
  - Testing the model
  - Verifing confidentiality properties
  - Verifying authentication properties
  - Running example: Request-Response (RPC) with public-key cryptography
* Working Session [2h]
  - Install ProVerif (preferably before workshop)
  - Run the RPC examples
  - Exercices: Fix bugs and prove additional properties
* Lunch Break
* Stronger Security Guarantees in ProVerif [1h]
  - Modeling key compromise
    * Verifying forward secrecy
    * Verifying post-compromise security
  - Modeling quantum adversaries
    * Verifying security against passive and active quantum attackers
  - Modeling stronger confidentiality properties
    * Indistinguishability
    * Privacy
  - Running example: Authenticated Key Exchange + Request-Response 
* Working Session [2h]
  - Run the examples
  - Try to state and prove stronger properties

### Day 2

* Real-World Protocol Analysis [1h]
  - Modeling advanced crypto primitives (ZKP, MPC)
  - Abstracting a protocol without losing its essence
  - Dealing with message formats
  - Dealing with sub-protocols
  - Running example: TLS/Signal
* Working Session [2h]
  - Build a ProVerif model for your own favourite protocol
  - Prove some properties
* Lunch Break
* Working Session [2h]
  - Build a ProVerif model for your own favourite protocol
  - Prove some properties
* Next Steps [0.5h]
  - Maintaining your model
  - Linking models to implementations
  - Cryptographic proofs with CryptoVerif
