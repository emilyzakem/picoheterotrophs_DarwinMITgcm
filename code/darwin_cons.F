#include "DARWIN_OPTIONS.h"

c=============================================================
c subroutine DARWIN_cons
c check conservation in the model
C==============================================================
      SUBROUTINE DARWIN_CONS(myIter,myTime,myThid)
#include "SIZE.h"
#include "EEPARAMS.h"
#include "PARAMS.h"
#include "GRID.h"
#include "PTRACERS_SIZE.h"
#include "PTRACERS_FIELDS.h"
#include "DARWIN_SIZE.h"
#include "DARWIN_INDICES.h"
#include "DARWIN_PARAMS.h"
#include "DARWIN_TRAITS.h"
#include "DARWIN_FIELDS.h"

C     === Global variables ===
      _RL myTime
      INTEGER myIter
      INTEGER myThid

#ifdef DARWIN_ALLOW_CONS

C============== Local variables ============================================
      _RL tmptotC
      _RL tmptotP
      _RL tmptotN
      _RL tmptotSi
      _RL tmptotFe
#ifdef DARWIN_ALLOW_CARBON
      _RL tmptotA
      _RL tmptotO
#endif
      _RL tmptotNfix
      _RL tmptotNdenit
      _RL vol, voltot

      INTEGER i,j,k,bi,bj
      INTEGER np, iTr
c
      tmptotC = 0. _d 0
      tmptotP = 0. _d 0
      tmptotN = 0. _d 0
      tmptotFe = 0. _d 0
      tmptotSi = 0. _d 0
#ifdef DARWIN_ALLOW_CARBON
      tmptotA = 0. _d 0
      tmptotO = 0. _d 0
#endif
      tmptotNfix = 0. _d 0
      tmptotNdenit = 0. _d 0
      voltot = 0. _d 0

      DO bj=myByLo(myThid),myByHi(myThid)
      DO bi=myBxLo(myThid),myBxHi(myThid)
 
        DO k=1,Nr
        DO i=1,sNx
        DO j=1,sNy
c-----------------------------------------------------------------
          vol=rA(i,j,bi,bj)*drF(k)*hFacC(i,j,k,bi,bj)
          voltot=voltot+vol

c carbon budget
          tmptotC=tmptotC+Ptracer(i,j,k,bi,bj,iDIC)*vol
          tmptotC=tmptotC+Ptracer(i,j,k,bi,bj,iDOC)*vol
          tmptotC=tmptotC+Ptracer(i,j,k,bi,bj,iDOC2)*vol
          tmptotC=tmptotC+Ptracer(i,j,k,bi,bj,iDOC3)*vol
          tmptotC=tmptotC+Ptracer(i,j,k,bi,bj,iDOC4)*vol
          tmptotC=tmptotC+Ptracer(i,j,k,bi,bj,iDOC5)*vol
          tmptotC=tmptotC+Ptracer(i,j,k,bi,bj,iPOC)*vol
          tmptotC=tmptotC+Ptracer(i,j,k,bi,bj,iPOC2)*vol
          tmptotC=tmptotC+Ptracer(i,j,k,bi,bj,iPOC3)*vol
          tmptotC=tmptotC+Ptracer(i,j,k,bi,bj,iPIC)*vol
          DO np=1,nplank
            iTr=ic+np-1
            tmptotC=tmptotC+Ptracer(i,j,k,bi,bj,iTr)*vol
          ENDDO
#ifdef DARWIN_ALLOW_CDOM
          tmptotC=tmptotC+Ptracer(i,j,k,bi,bj,iCDOM)*R_CP_CDOM*vol
#endif

c Phosphorus budget
          tmptotP=tmptotP+Ptracer(i,j,k,bi,bj,iPO4)*vol
          tmptotP=tmptotP+Ptracer(i,j,k,bi,bj,iDOP)*vol
          tmptotP=tmptotP+Ptracer(i,j,k,bi,bj,iDOP2)*vol
          tmptotP=tmptotP+Ptracer(i,j,k,bi,bj,iDOP3)*vol
          tmptotP=tmptotP+Ptracer(i,j,k,bi,bj,iDOP4)*vol
          tmptotP=tmptotP+Ptracer(i,j,k,bi,bj,iDOP5)*vol
          tmptotP=tmptotP+Ptracer(i,j,k,bi,bj,iPOP)*vol
          tmptotP=tmptotP+Ptracer(i,j,k,bi,bj,iPOP2)*vol
          tmptotP=tmptotP+Ptracer(i,j,k,bi,bj,iPOP3)*vol
          DO np=1,nplank
#ifdef DARWIN_ALLOW_PQUOTA
            iTr=ip+np-1
            tmptotP=tmptotP+Ptracer(i,j,k,bi,bj,iTr)*vol
#else
            iTr=ic+np-1
            tmptotP=tmptotP+Ptracer(i,j,k,bi,bj,iTr)*R_PC(np)*vol
#endif
          ENDDO
#ifdef DARWIN_ALLOW_CDOM
          tmptotP=tmptotP+Ptracer(i,j,k,bi,bj,iCDOM)*vol
#endif

c Nitrogen budget
          tmptotN=tmptotN+Ptracer(i,j,k,bi,bj,iNO3)*vol
          tmptotN=tmptotN+Ptracer(i,j,k,bi,bj,iNH4)*vol
          tmptotN=tmptotN+Ptracer(i,j,k,bi,bj,iNO2)*vol
          tmptotN=tmptotN+Ptracer(i,j,k,bi,bj,iDON)*vol
          tmptotN=tmptotN+Ptracer(i,j,k,bi,bj,iDON2)*vol
          tmptotN=tmptotN+Ptracer(i,j,k,bi,bj,iDON3)*vol
          tmptotN=tmptotN+Ptracer(i,j,k,bi,bj,iDON4)*vol
          tmptotN=tmptotN+Ptracer(i,j,k,bi,bj,iDON5)*vol
          tmptotN=tmptotN+Ptracer(i,j,k,bi,bj,iPON)*vol
          tmptotN=tmptotN+Ptracer(i,j,k,bi,bj,iPON2)*vol
          tmptotN=tmptotN+Ptracer(i,j,k,bi,bj,iPON3)*vol
          DO np=1,nplank
#ifdef DARWIN_ALLOW_NQUOTA
            iTr=in+np-1
            tmptotN=tmptotN+Ptracer(i,j,k,bi,bj,iTr)*vol
#else
            iTr=ic+np-1
            tmptotN=tmptotN+Ptracer(i,j,k,bi,bj,iTr)*R_NC(np)*vol
#endif
          ENDDO
#ifdef DARWIN_ALLOW_CDOM
          tmptotN=tmptotN+Ptracer(i,j,k,bi,bj,iCDOM)*R_NP_CDOM*vol
#endif

c Iron budget
          tmptotFe=tmptotFe+Ptracer(i,j,k,bi,bj,iFeT)*vol
          tmptotFe=tmptotFe+Ptracer(i,j,k,bi,bj,iDOFe)*vol
          tmptotFe=tmptotFe+Ptracer(i,j,k,bi,bj,iDOFe2)*vol
          tmptotFe=tmptotFe+Ptracer(i,j,k,bi,bj,iDOFe3)*vol
          tmptotFe=tmptotFe+Ptracer(i,j,k,bi,bj,iDOFe4)*vol
          tmptotFe=tmptotFe+Ptracer(i,j,k,bi,bj,iDOFe5)*vol
          tmptotFe=tmptotFe+Ptracer(i,j,k,bi,bj,iPOFe)*vol
          tmptotFe=tmptotFe+Ptracer(i,j,k,bi,bj,iPOFe2)*vol
          tmptotFe=tmptotFe+Ptracer(i,j,k,bi,bj,iPOFe3)*vol
          DO np=1,nplank
#ifdef DARWIN_ALLOW_FEQUOTA
            iTr=ife+np-1
            tmptotFe=tmptotFe+Ptracer(i,j,k,bi,bj,iTr)*vol
#else
            iTr=ic+np-1
            tmptotFe=tmptotFe+Ptracer(i,j,k,bi,bj,iTr)*R_FeC(np)*vol
#endif
          ENDDO
#ifdef DARWIN_ALLOW_CDOM
          tmptotFe=tmptotFe+Ptracer(i,j,k,bi,bj,iCDOM)*R_FeP_CDOM*vol
#endif

c Silica budget
          tmptotSi=tmptotSi+Ptracer(i,j,k,bi,bj,iSiO2)*vol
          tmptotSi=tmptotSi+Ptracer(i,j,k,bi,bj,iPOSi)*vol
          DO np=1,nplank
#ifdef DARWIN_ALLOW_SIQUOTA
            iTr=isi+np-1
            tmptotSi=tmptotSi+Ptracer(i,j,k,bi,bj,iTr)*vol
#else
            iTr=ic+np-1
            tmptotSi=tmptotSi+Ptracer(i,j,k,bi,bj,iTr)*R_SiC(np)*vol
#endif
          ENDDO
c------------------------------------------------------------
#ifdef DARWIN_ALLOW_CARBON
c alkalinity budget !!!!! NOT FULL BUDGET!!!!!
          tmptotA=tmptotA+Ptracer(i,j,k,bi,bj,iALK)*vol
c oxygem budget !!!!!!!! NOT FULL BUDGET !!!!!!!!!!!
          tmptotO=tmptotO+Ptracer(i,j,k,bi,bj,iO2)*vol
#endif

          tmptotNfix=tmptotNfix+DARWIN_Nfix(i,j,k,bi,bj)*vol
          tmptotNdenit=tmptotNdenit+DARWIN_Ndenit(i,j,k,bi,bj)*vol
        ENDDO
        ENDDO
        ENDDO
      ENDDO
      ENDDO

      _GLOBAL_SUM_RL(tmptotC,myThid)
      _GLOBAL_SUM_RL(tmptotP,myThid)
      _GLOBAL_SUM_RL(tmptotN,myThid)
      _GLOBAL_SUM_RL(tmptotFe,myThid)
      _GLOBAL_SUM_RL(tmptotSi,myThid)
      _GLOBAL_SUM_RL(voltot,myThid)
#ifdef DARWIN_ALLOW_CARBON
      _GLOBAL_SUM_RL(tmptotA,myThid)
      _GLOBAL_SUM_RL(tmptotO,myThid)
#endif
      _GLOBAL_SUM_RL(tmptotNfix,myThid)
      _GLOBAL_SUM_RL(tmptotNdenit,myThid)

      IF ( myProcId.EQ.0 .AND. myThid.EQ.1 ) THEN
        WRITE(DAR_cons_C_unit,*), myIter, tmptotC, tmptotC/voltot
        WRITE(DAR_cons_P_unit,*), myIter, tmptotP, tmptotP/voltot
        WRITE(DAR_cons_N_unit,'(I12,4E24.16)'), myIter, tmptotN,
     &        tmptotN/voltot, tmptotNfix/voltot, tmptotNdenit/voltot
        WRITE(DAR_cons_Fe_unit,*), myIter, tmptotFe, tmptotFe/voltot
        WRITE(DAR_cons_Si_unit,*), myIter, tmptotSi, tmptotSi/voltot
#ifdef DARWIN_ALLOW_CARBON
        WRITE(DAR_cons_A_unit,*), myIter, tmptotA, tmptotA/voltot
        WRITE(DAR_cons_O_unit,*), myIter, tmptotO, tmptotO/voltot
#endif
      ENDIF

C--   Everyone else must wait
      _BARRIER

#endif /* DARWIN_ALLOW_CONS */

      RETURN
      END

