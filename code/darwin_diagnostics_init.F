#include "DARWIN_OPTIONS.h"

CBOP
C     !ROUTINE: DARWIN_DIAGNOSTICS_INIT

C     !INTERFACE:
      SUBROUTINE DARWIN_DIAGNOSTICS_INIT( myThid )

C     !DESCRIPTION:
C     Routine to initialize Darwin diagnostics

C     !USES:
      IMPLICIT NONE
#include "SIZE.h"
#include "EEPARAMS.h"
#include "PARAMS.h"
#include "PTRACERS_SIZE.h"
#include "PTRACERS_PARAMS.h"
#ifdef ALLOW_RADTRANS
#include "RADTRANS_SIZE.h"
#endif
#include "DARWIN_SIZE.h"
#include "DARWIN_INDICES.h"

C     !INPUT PARAMETERS:
C     myThid :: Number of this instance of DARWIN_DIAGNOSTICS_INIT
      INTEGER myThid
CEOP

#ifdef ALLOW_DARWIN
#ifdef ALLOW_DIAGNOSTICS

C     !FUNCTIONS:
      INTEGER     ILNBLNK
      EXTERNAL    ILNBLNK
      CHARACTER*16 DIAGS_MK_UNITS
      EXTERNAL     DIAGS_MK_UNITS

C     !LOCAL VARIABLES:
C     msgBuf :: Informational/error meesage buffer
c     CHARACTER*(MAX_LEN_MBUF) msgBuf
      INTEGER j
      INTEGER        diagNum
      CHARACTER*8    diagName
      CHARACTER*16   diagCode
      CHARACTER*16   diagUnits
      CHARACTER*(80) diagTitle
      INTEGER      ilnb
      CHARACTER*7  trcUnits
      CHARACTER*30 locName
      CHARACTER*4  diagSufx

C---+----1----+----2----+----3----+----4----+----5----+----6----+----7-|--+----|

      WRITE(diagName,'(A)')'PP'
      WRITE(diagTitle,'(A)')'Primary Production'
      diagUnits = 'mmol C/m^3/s    '
      diagCode  = 'SMRP    MR      '
      CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I           diagName, diagCode, diagUnits, diagTitle, 0, myThid )

      WRITE(diagName,'(A)')'Nfix'
      WRITE(diagTitle,'(A)')'N fixation'
      diagUnits = 'mmol N/m^3/s    '
      diagCode  = 'SMRP    MR      '
      CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I           diagName, diagCode, diagUnits, diagTitle, 0, myThid )

      WRITE(diagName,'(A)')'Denit'
      WRITE(diagTitle,'(A)')'Denitrification'
      diagUnits = 'mmol N/m^3/s    '
      diagCode  = 'SMRP    MR      '
      CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I           diagName, diagCode, diagUnits, diagTitle, 0, myThid )

      WRITE(diagName,'(A)')'DenitN'
      WRITE(diagTitle,'(A)')'Nitrogen loss due to denitrification'
      diagUnits = 'mmol N/m^3/s    '
      diagCode  = 'SMRP    MR      '
      CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I           diagName, diagCode, diagUnits, diagTitle, 0, myThid )

      WRITE(diagName,'(A)')'PupNH4'
      WRITE(diagTitle,'(A)')'Uptake of NH4 by all phytopl'
      diagUnits = 'mmol N/m^3/s    '
      diagCode  = 'SMRP    MR      '
      CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I           diagName, diagCode, diagUnits, diagTitle, 0, myThid )

      WRITE(diagName,'(A)')'PupNO2'
      WRITE(diagTitle,'(A)')'Uptake of NO2 by all phytopl'
      diagUnits = 'mmol N/m^3/s    '
      diagCode  = 'SMRP    MR      '
      CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I           diagName, diagCode, diagUnits, diagTitle, 0, myThid )

      WRITE(diagName,'(A)')'PupNO3'
      WRITE(diagTitle,'(A)')'Uptake of NO3 by all phytopl'
      diagUnits = 'mmol N/m^3/s    '
      diagCode  = 'SMRP    MR      '
      CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I           diagName, diagCode, diagUnits, diagTitle, 0, myThid )

      WRITE(diagName,'(A)')'PupPO4'
      WRITE(diagTitle,'(A)')'Uptake of PO4 by all phytopl'
      diagUnits = 'mmol P/m^3/s    '
      diagCode  = 'SMRP    MR      '
      CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I           diagName, diagCode, diagUnits, diagTitle, 0, myThid )

      WRITE(diagName,'(A)')'BupNH4'
      WRITE(diagTitle,'(A)')'Uptake of NH4 by all het bacteria'
      diagUnits = 'mmol N/m^3/s    '
      diagCode  = 'SMRP    MR      '
      CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I           diagName, diagCode, diagUnits, diagTitle, 0, myThid )

      WRITE(diagName,'(A)')'BupPO4'
      WRITE(diagTitle,'(A)')'Uptake of PO4 by all het bacteria'
      diagUnits = 'mmol P/m^3/s    '
      diagCode  = 'SMRP    MR      '
      CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I           diagName, diagCode, diagUnits, diagTitle, 0, myThid )

      WRITE(diagName,'(A)')'test'
      WRITE(diagTitle,'(A)')'test diagnostic'
      diagUnits = 'NA    '
      diagCode  = 'SMRP    MR      '
      CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I           diagName, diagCode, diagUnits, diagTitle, 0, myThid )

      WRITE(diagName,'(A)')'prodPOC'
      WRITE(diagTitle,'(A)')'Production of POC pool 1'
      diagUnits = 'mmol C/m^3/s    '
      diagCode  = 'SMRP    MR      '
      CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I           diagName, diagCode, diagUnits, diagTitle, 0, myThid )

      WRITE(diagName,'(A)')'prodPOC2'
      WRITE(diagTitle,'(A)')'Production of POC pool 2'
      diagUnits = 'mmol C/m^3/s    '
      diagCode  = 'SMRP    MR      '
      CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I           diagName, diagCode, diagUnits, diagTitle, 0, myThid )

      WRITE(diagName,'(A)')'prodPOC3'
      WRITE(diagTitle,'(A)')'Production of POC pool 3'
      diagUnits = 'mmol C/m^3/s    '
      diagCode  = 'SMRP    MR      '
      CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I           diagName, diagCode, diagUnits, diagTitle, 0, myThid )

      WRITE(diagName,'(A)')'prodDOC'
      WRITE(diagTitle,'(A)')'Production of DOC pool 1'
      diagUnits = 'mmol C/m^3/s    '
      diagCode  = 'SMRP    MR      '
      CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I           diagName, diagCode, diagUnits, diagTitle, 0, myThid )

      WRITE(diagName,'(A)')'prodDOC2'
      WRITE(diagTitle,'(A)')'Production of DOC pool 2'
      diagUnits = 'mmol C/m^3/s    '
      diagCode  = 'SMRP    MR      '
      CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I           diagName, diagCode, diagUnits, diagTitle, 0, myThid )

      WRITE(diagName,'(A)')'prodDOC3'
      WRITE(diagTitle,'(A)')'Production of DOC pool 3'
      diagUnits = 'mmol C/m^3/s    '
      diagCode  = 'SMRP    MR      '
      CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I           diagName, diagCode, diagUnits, diagTitle, 0, myThid )

      WRITE(diagName,'(A)')'prodDOC4'
      WRITE(diagTitle,'(A)')'Production of DOC pool 4'
      diagUnits = 'mmol C/m^3/s    '
      diagCode  = 'SMRP    MR      '
      CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I           diagName, diagCode, diagUnits, diagTitle, 0, myThid )

      WRITE(diagName,'(A)')'prodDOC5'
      WRITE(diagTitle,'(A)')'Production of DOC pool 5'
      diagUnits = 'mmol C/m^3/s    '
      diagCode  = 'SMRP    MR      '
      CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I           diagName, diagCode, diagUnits, diagTitle, 0, myThid )

      WRITE(diagName,'(A)')'consPOC'
      WRITE(diagTitle,'(A)')'Consumption of POC pool 1'
      diagUnits = 'mmol C/m^3/s    '
      diagCode  = 'SMRP    MR      '
      CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I           diagName, diagCode, diagUnits, diagTitle, 0, myThid )

      WRITE(diagName,'(A)')'consPOC2'
      WRITE(diagTitle,'(A)')'Consumption of POC pool 2'
      diagUnits = 'mmol C/m^3/s    '
      diagCode  = 'SMRP    MR      '
      CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I           diagName, diagCode, diagUnits, diagTitle, 0, myThid )

      WRITE(diagName,'(A)')'consPOC3'
      WRITE(diagTitle,'(A)')'Consumption of POC pool 3'
      diagUnits = 'mmol C/m^3/s    '
      diagCode  = 'SMRP    MR      '
      CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I           diagName, diagCode, diagUnits, diagTitle, 0, myThid )

      WRITE(diagName,'(A)')'consDOC'
      WRITE(diagTitle,'(A)')'Consumption of DOC pool 1'
      diagUnits = 'mmol C/m^3/s    '
      diagCode  = 'SMRP    MR      '
      CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I           diagName, diagCode, diagUnits, diagTitle, 0, myThid )

      WRITE(diagName,'(A)')'consDOC2'
      WRITE(diagTitle,'(A)')'Consumption of DOC pool 2'
      diagUnits = 'mmol C/m^3/s    '
      diagCode  = 'SMRP    MR      '
      CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I           diagName, diagCode, diagUnits, diagTitle, 0, myThid )

      WRITE(diagName,'(A)')'consDOC3'
      WRITE(diagTitle,'(A)')'Consumption of DOC pool 3'
      diagUnits = 'mmol C/m^3/s    '
      diagCode  = 'SMRP    MR      '
      CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I           diagName, diagCode, diagUnits, diagTitle, 0, myThid )

      WRITE(diagName,'(A)')'consDOC4'
      WRITE(diagTitle,'(A)')'Consumption of DOC pool 4'
      diagUnits = 'mmol C/m^3/s    '
      diagCode  = 'SMRP    MR      '
      CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I           diagName, diagCode, diagUnits, diagTitle, 0, myThid )

      WRITE(diagName,'(A)')'consDOC5'
      WRITE(diagTitle,'(A)')'Consumption of DOC pool 5'
      diagUnits = 'mmol C/m^3/s    '
      diagCode  = 'SMRP    MR      '
      CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I           diagName, diagCode, diagUnits, diagTitle, 0, myThid )
      
      WRITE(diagName,'(A)')'consPON'
      WRITE(diagTitle,'(A)')'Consumption of PON pool 1'
      diagUnits = 'mmol C/m^3/s    '
      diagCode  = 'SMRP    MR      '
      CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I           diagName, diagCode, diagUnits, diagTitle, 0, myThid )

      WRITE(diagName,'(A)')'consPON2'
      WRITE(diagTitle,'(A)')'Consumption of PON pool 2'
      diagUnits = 'mmol C/m^3/s    '
      diagCode  = 'SMRP    MR      '
      CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I           diagName, diagCode, diagUnits, diagTitle, 0, myThid )

      WRITE(diagName,'(A)')'consPON3'
      WRITE(diagTitle,'(A)')'Consumption of PON pool 3'
      diagUnits = 'mmol C/m^3/s    '
      diagCode  = 'SMRP    MR      '
      CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I           diagName, diagCode, diagUnits, diagTitle, 0, myThid )

      WRITE(diagName,'(A)')'consDON'
      WRITE(diagTitle,'(A)')'Consumption of DON pool 1'
      diagUnits = 'mmol C/m^3/s    '
      diagCode  = 'SMRP    MR      '
      CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I           diagName, diagCode, diagUnits, diagTitle, 0, myThid )

      WRITE(diagName,'(A)')'consDON2'
      WRITE(diagTitle,'(A)')'Consumption of DON pool 2'
      diagUnits = 'mmol C/m^3/s    '
      diagCode  = 'SMRP    MR      '
      CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I           diagName, diagCode, diagUnits, diagTitle, 0, myThid )

      WRITE(diagName,'(A)')'consDON3'
      WRITE(diagTitle,'(A)')'Consumption of DON pool 3'
      diagUnits = 'mmol C/m^3/s    '
      diagCode  = 'SMRP    MR      '
      CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I           diagName, diagCode, diagUnits, diagTitle, 0, myThid )

      WRITE(diagName,'(A)')'consDON4'
      WRITE(diagTitle,'(A)')'Consumption of DON pool 4'
      diagUnits = 'mmol C/m^3/s    '
      diagCode  = 'SMRP    MR      '
      CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I           diagName, diagCode, diagUnits, diagTitle, 0, myThid )

      WRITE(diagName,'(A)')'consDON5'
      WRITE(diagTitle,'(A)')'Consumption of DON pool 5'
      diagUnits = 'mmol C/m^3/s    '
      diagCode  = 'SMRP    MR      '
      CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I           diagName, diagCode, diagUnits, diagTitle, 0, myThid )

#ifdef ALLOW_RADTRANS
      DO j = 1, nlam
        WRITE(diagName,'(A,I3.3)')'PAR',j
        WRITE(diagTitle,'(A,I3)')'PAR waveband ',j
        diagUnits = 'uEin/m^2/s      '
        diagCode  = 'SMRP    MR      '
        CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I             diagName, diagCode, diagUnits, diagTitle, 0, myThid )

        WRITE(diagName,'(A,I3.3)')'PARF',j
        WRITE(diagTitle,'(A,I3)')'PAR at W point, waveband ',j
        diagUnits = 'uEin/m^2/s      '
        diagCode  = 'SMRP    LR      '
        CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I             diagName, diagCode, diagUnits, diagTitle, 0, myThid )

#ifdef DARWIN_DIAG_IOP
        WRITE(diagName,'(A,I3.3)')'a',j
        WRITE(diagTitle,'(A,I3)')
     &        'total absorption for waveband ',j
        diagUnits = '1/m             '
        diagCode  = 'SMRP    MR      '
        CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I             diagName, diagCode, diagUnits, diagTitle, 0, myThid )

        WRITE(diagName,'(A,I3.3)')'bt',j
        WRITE(diagTitle,'(A,I3)')
     &        'total scattering for waveband ',j
        diagUnits = '1/m             '
        diagCode  = 'SMRP    MR      '
        CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I             diagName, diagCode, diagUnits, diagTitle, 0, myThid )

        WRITE(diagName,'(A,I3.3)')'bb',j
        WRITE(diagTitle,'(A,I3)')
     &        'total backscattering for waveband ',j
        diagUnits = '1/m             '
        diagCode  = 'SMRP    MR      '
        CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I             diagName, diagCode, diagUnits, diagTitle, 0, myThid )

        WRITE(diagName,'(A,I3.3)')'aplk',j
        WRITE(diagTitle,'(A,I3)')
     &        'absorption by plankton for waveband ',j
        diagUnits = '1/m             '
        diagCode  = 'SMRP    MR      '
        CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I             diagName, diagCode, diagUnits, diagTitle, 0, myThid )

        WRITE(diagName,'(A,I3.3)')'btplk',j
        WRITE(diagTitle,'(A,I3)')
     &        'scattering by plankton for waveband ',j
        diagUnits = '1/m             '
        diagCode  = 'SMRP    MR      '
        CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I             diagName, diagCode, diagUnits, diagTitle, 0, myThid )

        WRITE(diagName,'(A,I3.3)')'bbplk',j
        WRITE(diagTitle,'(A,I3)')
     &        'backscattering by plankton for waveband ',j
        diagUnits = '1/m             '
        diagCode  = 'SMRP    MR      '
        CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I             diagName, diagCode, diagUnits, diagTitle, 0, myThid )

        WRITE(diagName,'(A,I3.3)')'aprt',j
        WRITE(diagTitle,'(A,I3)')
     &        'absorption by particles for waveband ',j
        diagUnits = '1/m             '
        diagCode  = 'SMRP    MR      '
        CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I             diagName, diagCode, diagUnits, diagTitle, 0, myThid )

        WRITE(diagName,'(A,I3.3)')'btprt',j
        WRITE(diagTitle,'(A,I3)')
     &        'scattering by particles for waveband ',j
        diagUnits = '1/m             '
        diagCode  = 'SMRP    MR      '
        CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I             diagName, diagCode, diagUnits, diagTitle, 0, myThid )

        WRITE(diagName,'(A,I3.3)')'bbprt',j
        WRITE(diagTitle,'(A,I3)')
     &        'backscattering by particles for waveband ',j
        diagUnits = '1/m             '
        diagCode  = 'SMRP    MR      '
        CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I             diagName, diagCode, diagUnits, diagTitle, 0, myThid )

        WRITE(diagName,'(A,I3.3)')'aCDOM',j
        WRITE(diagTitle,'(A,I3)')
     &        'absorption by CDOM for waveband ',j
        diagUnits = '1/m             '
        diagCode  = 'SMRP    MR      '
        CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I             diagName, diagCode, diagUnits, diagTitle, 0, myThid )
#endif

      ENDDO
#endif /* ALLOW_RADTRANS */

      WRITE(diagName,'(A)')'atten'
      WRITE(diagTitle,'(A)')'attenuation in layer'
      diagUnits = '1               '
      diagCode  = 'SMRP    MR      '
      CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I           diagName, diagCode, diagUnits, diagTitle, 0, myThid )

      WRITE(diagName,'(A)')'PARF'
      WRITE(diagTitle,'(A)')'PAR at top of layer'
      diagUnits = 'uEin/m^2/s      '
      diagCode  = 'SMRP    LR      '
      CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I           diagName, diagCode, diagUnits, diagTitle, 0, myThid )

      WRITE(diagName,'(A)')'PAR'
      WRITE(diagTitle,'(A,I3)')'total PAR at layer center'
      diagUnits = 'uEin/m^2/s      '
      diagCode  = 'SMRP    MR      '
      CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I           diagName, diagCode, diagUnits, diagTitle, 0, myThid )

c nutrient consumption
      WRITE(diagName,'(A)')'C_DIN'
      WRITE(diagTitle,'(A)')'consumption of DIN'
      diagUnits = 'mmolN/m3/s      '
      diagCode  = 'SM P    MR      '
      CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I           diagName, diagCode, diagUnits, diagTitle, 0, myThid )

      WRITE(diagName,'(A)')'C_PO4'
      WRITE(diagTitle,'(A)')'consumption of PO4'
      diagUnits = 'mmolP/m3/s      '
      diagCode  = 'SM P    MR      '
      CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I           diagName, diagCode, diagUnits, diagTitle, 0, myThid )

      WRITE(diagName,'(A)')'C_Si'
      WRITE(diagTitle,'(A)')'consumption of Si'
      diagUnits = 'mmolSi/m3/s      '
      diagCode  = 'SM P    MR      '
      CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I           diagName, diagCode, diagUnits, diagTitle, 0, myThid )

      WRITE(diagName,'(A)')'C_Fe'
      WRITE(diagTitle,'(A)')'consumption of Fe'
      diagUnits = 'mmolFe/m3/s      '
      diagCode  = 'SM P    MR      '
      CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I           diagName, diagCode, diagUnits, diagTitle, 0, myThid )

c additional source terms of nutrients
      WRITE(diagName,'(A)')'S_DIN'
      WRITE(diagTitle,'(A)')'non-transport source of DIN'
      diagUnits = 'mmolN/m3/s      '
      diagCode  = 'SM      MR      '
      CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I           diagName, diagCode, diagUnits, diagTitle, 0, myThid )

      WRITE(diagName,'(A)')'S_PO4'
      WRITE(diagTitle,'(A)')'non-transport source of PO4'
      diagUnits = 'mmolP/m3/s      '
      diagCode  = 'SM      MR      '
      CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I           diagName, diagCode, diagUnits, diagTitle, 0, myThid )

      WRITE(diagName,'(A)')'S_Si'
      WRITE(diagTitle,'(A)')'non-transport source of Si'
      diagUnits = 'mmolSi/m3/s      '
      diagCode  = 'SM      MR      '
      CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I           diagName, diagCode, diagUnits, diagTitle, 0, myThid )

      WRITE(diagName,'(A)')'S_Fe'
      WRITE(diagTitle,'(A)')'non-transport source of Fe'
      diagUnits = 'mmolFe/m3/s      '
      diagCode  = 'SM      MR      '
      CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I           diagName, diagCode, diagUnits, diagTitle, 0, myThid )

      DO j = 1, nDarwin
        WRITE(diagName, '(2A)') 'gDAR', PTRACERS_ioLabel(j)
C--     Set default name & tracer Units:
        WRITE(locName,'(A,I4.4,A)') 'Tracer ', j
        trcUnits  = 'kg/kg  '
C-      use units & names from data.ptracers :
        ilnb = ILNBLNK(PTRACERS_units(j))
        IF ( ilnb.GE.1 ) THEN
         ilnb = LEN(trcUnits)
         trcUnits = PTRACERS_units(j)(1:ilnb)
        ENDIF
        ilnb = ILNBLNK(PTRACERS_names(j))
        IF ( ilnb.GE.1 ) THEN
         ilnb = MIN(LEN(locName),ilnb)
         WRITE(locName,'(A)') PTRACERS_names(j)(1:ilnb)
        ENDIF
        ilnb = MAX(ILNBLNK(locName),1)
        WRITE(diagTitle,'(2A)') locName(1:ilnb), ' tendency from DARWIN'
        diagUnits = DIAGS_MK_UNITS( trcUnits//'/s', myThid )
        diagCode  = 'SMR     MR      '
        CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I             diagName, diagCode, diagUnits, diagTitle, 0, myThid )
      ENDDO

      DO j = 1, nPPplank
        WRITE(diagName,'(A,I4.4)')'PP',j
        WRITE(diagTitle,'(A,I4)')'Primary Production plankton ',j
        diagUnits = 'mmol C/m^3/s    '
        diagCode  = 'SMRP    MR      '
        CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I             diagName, diagCode, diagUnits, diagTitle, 0, myThid )
      ENDDO

      DO j = 1, nGRplank
        WRITE(diagName,'(A,I4.4)')'GR',j
        WRITE(diagTitle,'(A,I4)')'Grazing loss of plankton ',j
        diagUnits = 'mmol C/m^3/s    '
        diagCode  = 'SMRP    MR      '
        CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I             diagName, diagCode, diagUnits, diagTitle, 0, myThid )
      ENDDO

#ifdef DARWIN_ALLOW_CARBON
      WRITE(diagName,'(A)')'pH'
      WRITE(diagTitle,'(A)')'pH'
      diagUnits = '1               '
      diagCode  = 'SMR     MR      '
      CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I           diagName, diagCode, diagUnits, diagTitle, 0, myThid )

      WRITE(diagName,'(A)')'pCO2'
      WRITE(diagTitle,'(A)')'Partial Pressure of CO2'
      diagUnits = 'atm             '
      diagCode  = 'SMRP    MR      '
      CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I           diagName, diagCode, diagUnits, diagTitle, 0, myThid )

      WRITE(diagName,'(A)')'fugfCO2'
      WRITE(diagTitle,'(A)')'Fugacity factor of CO2 (atm)'
      diagUnits = 'atm             '
      diagCode  = 'SM P    L1      '
      CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I           diagName, diagCode, diagUnits, diagTitle, 0, myThid )

      WRITE(diagName,'(A)')'fluxCO2'
      WRITE(diagTitle,'(A)')'Flux of CO2 - air-sea exch'
      diagUnits = 'mmol C/m2/s     '
      diagCode  = 'SM      L1      '
      CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I           diagName, diagCode, diagUnits, diagTitle, 0, myThid )

      WRITE(diagName,'(A)')'gDICsurf'
      WRITE(diagTitle,'(A)')
     &            'Tendency of DIC due to air-sea exch + oldvirt.flux'
      diagUnits = 'mmol C/m3/s     '
      diagCode  = 'SM      L1      '
      CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I           diagName, diagCode, diagUnits, diagTitle, 0, myThid )

      WRITE(diagName,'(A)')'gALKsurf'
      WRITE(diagTitle,'(A)')'Tendency of ALK due to oldvirt.flux'
      diagUnits = 'mmol eq/m3/s    '
      diagCode  = 'SM      L1      '
      CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I           diagName, diagCode, diagUnits, diagTitle, 0, myThid )

      WRITE(diagName,'(A)')'gO2surf'
      WRITE(diagTitle,'(A)')'Tendency of O2 due to air-sea exch'
      diagUnits = 'mmol O2/m3/s    '
      diagCode  = 'SM      L1      '
      CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I           diagName, diagCode, diagUnits, diagTitle, 0, myThid )
#endif /* DARWIN_ALLOW_CARBON */

#ifdef ALLOW_EXF
      WRITE(diagName,'(A)')'surfPAR'
      WRITE(diagTitle,'(A)')'PAR forcing at surface'
      diagUnits = 'uEin/m^2/s      '
      diagCode  = 'SM P    L1      '
      CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I           diagName, diagCode, diagUnits, diagTitle, 0, myThid )

      WRITE(diagName,'(A)')'surfiron'
      WRITE(diagTitle,'(A)')'iron forcing at surface'
      diagUnits = 'mmol Fe/m^2/s   '
      diagCode  = 'SM P    L1      '
      CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I           diagName, diagCode, diagUnits, diagTitle, 0, myThid )

      WRITE(diagName,'(A)')'DARice'
      WRITE(diagTitle,'(A)')'ice area fraction'
      diagUnits = 'm^2/m^2         '
      diagCode  = 'SM P    L1      '
      CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I           diagName, diagCode, diagUnits, diagTitle, 0, myThid )

      WRITE(diagName,'(A)')'DARwind'
      WRITE(diagTitle,'(A)')'wind speed used for carbon exchange'
      diagUnits = 'm/s             '
      diagCode  = 'SM P    L1      '
      CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I           diagName, diagCode, diagUnits, diagTitle, 0, myThid )

      WRITE(diagName,'(A)')'surfpCO2'
      WRITE(diagTitle,'(A)')'surface pCO2'
      diagUnits = 'mol/mol         '
      diagCode  = 'SM P    L1      '
      CALL DIAGNOSTICS_ADDTOLIST( diagNum,
     I           diagName, diagCode, diagUnits, diagTitle, 0, myThid )
#endif

#endif /* ALLOW_DIAGNOSTICS */
#endif /* ALLOW_DARWIN */

      RETURN
      END

