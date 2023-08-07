*** SMIC SPICE model for 40nm logic low leakge 1.1V/1.8V/2.5V 1P10M process ***
*** For HSPICE only ***

1. Update History:

	V0.0:Initiate
	V1.4_1r: a. All models (MOS, BJT, Diode, resistor and interconnect etc) parameters are re-extracted due to process change (V2.0 process).
                 b. All the attachment has been updated.

2. Files:
	l0040ll_v1p4_1r_readme.txt 			.... This file		
	l0040ll_v1p4_1r.lib				.... Corner values for MOSFETs, Diode,BJT, Resistor, MOM and Varactor	
	l0040ll_v1p4_1r.mdl				.... Model parameters file for 1.1V/2.5V MOS	
	l0040ll_v1p4_1r_dio.mdl				.... Model parameters file for 1.1V/2.5V Diode	
	l0040ll_v1p4_1r_res.ckt				.... Macro model parameters file for Resistor	
	l0040ll_v1p4_1r_var.ckt				.... Macro model parameters file for Varactor	
	l0040ll_v1p4_1r_mom.ckt				.... Macro model parameters file for MOM Capacitor	
    l0040ll_v1p4_1r_ldmos.ckt                       .... Macro model parameters file for LDMOS.
	l0040ll_lpe_v1p4_1r_n11ll.mdl			.... LPE Model parameters file for 1.1V NMOS	
	l0040ll_lpe_v1p4_1r_p11ll.mdl			.... LPE Model parameters file for 1.1V PMOS	
	l0040ll_lpe_v1p4_1r_n25ll.mdl			.... LPE Model parameters file for 2.5V NMOS	
	l0040ll_lpe_v1p4_1r_p25ll.mdl			.... LPE Model parameters file for 2.5V PMOS	
	l0040ll_lpe_v1p4_1r_nhvt11ll.mdl		.... LPE Model parameters file for 1.1V HVT NMOS	
	l0040ll_lpe_v1p4_1r_phvt11ll.mdl		.... LPE Model parameters file for 1.1V HVT PMOS	
	l0040ll_lpe_v1p4_1r_nlvt11ll.mdl		.... LPE Model parameters file for 1.1V LVT NMOS	
	l0040ll_lpe_v1p4_1r_plvt11ll.mdl		.... LPE Model parameters file for 1.1V LVT PMOS	
	l0040ll_lpe_v1p4_1r_nod33ll.mdl			.... LPE Model parameters file for 2.5V OD 3.3V NMOS	
	l0040ll_lpe_v1p4_1r_pod33ll.mdl			.... LPE Model parameters file for 2.5V OD 3.3V PMOS	
	l0040ll_lpe_v1p4_1r_nud18ll.mdl			.... LPE Model parameters file for 2.5V UD 1.8V NMOS	
	l0040ll_lpe_v1p4_1r_pud18ll.mdl			.... LPE Model parameters file for 2.5V UD 1.8V PMOS	
	npn11a4ll.mdl					.... Model parameters file for 1.1V NPN BJT (Emitter Area=2x2um^2)
	npn11a25ll.mdl					.... Model parameters file for 1.1V NPN BJT (Emitter Area=5x5um^2)
	npn11a100ll.mdl					.... Model parameters file for 1.1V NPN BJT (Emitter Area=10x10um^2)
	npn25a4ll.mdl					.... Model parameters file for 2.5V NPN BJT (Emitter Area=2x2um^2)
	npn25a25ll.mdl					.... Model parameters file for 2.5V NPN BJT (Emitter Area=5x5um^2)
	npn25a100ll.mdl					.... Model parameters file for 2.5V NPN BJT (Emitter Area=10x10um^2)
	pnp11a4ll.mdl					.... Model parameters file for 1.1V PNP BJT (Emitter Area=2x2um^2)
	pnp11a25ll.mdl					.... Model parameters file for 1.1V PNP BJT (Emitter Area=5x5um^2)
	pnp11a100ll.mdl					.... Model parameters file for 1.1V PNP BJT (Emitter Area=10x10um^2)
	pnp25a4ll.mdl					.... Model parameters file for 2.5V PNP BJT (Emitter Area=2x2um^2)
	pnp25a25ll.mdl					.... Model parameters file for 2.5V PNP BJT (Emitter Area=5x5um^2)
	pnp25a100ll.mdl					.... Model parameters file for 2.5V PNP BJT (Emitter Area=10x10um^2)
	l0040ll_v1p4_1r_interconnect_struct_1.txt	.... Interconnect tables for structure-1 (Parallel lines above a bottom plate)			
	l0040ll_v1p4_1r_interconnect_struct_2.txt	.... Interconnect tables for structure-2 (Parallel lines between two plates)			
	simulator_version.txt				.... Simulation version list	

3. How to use SMIC SPICE models in HSPICE:
      Add the following statements to HSPICE netlist.
      
      a. Specify MOS, Diode ,BJT,Resistor, Varactor, LDMOS and MOM Capacitor model corner by the '.lib' statement;

         .lib '/xxx/xxx/l0040ll_v1p4_1r.lib' TT
                                             ^^ MOS model corner
         .lib '/xxx/xxx/l0040ll_v1p4_1r.lib' DIO_TT
                                               ^^ Diode model corner
         .lib '/xxx/xxx/l0040ll_v1p4_1r.lib' BJT_TT
                                               ^^ BJT model corner 
         .lib '/xxx/xxx/l0040ll_v1p4_1r.lib' RES_TT
                                               ^^ Resistor model corner  
         .lib '/xxx/xxx/l0040ll_v1p4_1r.lib' VAR_TT
                                               ^^ Varactor model corner  
         .lib '/xxx/xxx/l0040ll_v1p4_1r.lib' LDMOS_TT
                                               ^^ LDMOS model corner  
         .lib '/xxx/xxx/l0040ll_v1p4_1r.lib' MOM_TT
                                               ^^ MOM model corner  

      b. Specify MOS, Diode ,BJT,Resistor, Varactor, LDMOS and MOM Capacitor Monte Carlo model by the '.lib' statement;

         .lib '/xxx/xxx/l0040ll_v1p4_1r.lib' MOS_MC
                                               ^^ MOS Monte Carlo model 
         .lib '/xxx/xxx/l0040ll_v1p4_1r.lib' BJT_MC
                                               ^^ BJT model corner 
         .lib '/xxx/xxx/l0040ll_v1p4_1r.lib' RES_MC
                                               ^^ resistor Monte Carlo model 
         .lib '/xxx/xxx/l0040ll_v1p4_1r.lib' VAR_MC
                                               ^^ MOS varactor Monte Carlo model
         .lib '/xxx/xxx/l0040ll_v1p4_1r.lib' LDMOS_MC
                                               ^^ LDMOS Monte Carlo model
         .lib '/xxx/xxx/l0040ll_v1p4_1r.lib' MOM_MC
                                               ^^ MOM Monte Carlo model 

      c. Include MOS model parameters by the '.inc' statement;
         
         .inc '/xxx/xxx/l0040ll_v1p4_1r.mdl'
         (then add the following statement in your netlist to define subcircuit condition you want to simulate.)

         e.g. 1.1V Core NMOS
	xm1 D G S B  n11ll_ckt w=1e-6 l=1e-6 sa=0 sb=0 sd=0 as=0 ad=0 ps=0 pd=0 nrd=0 nrs=0 sca=0 scb=0 scc=0 nf=1 mr=1 globalmod=1 mismod=0 dps=0.126u dpcs=0.072u dsts=1u lpemod=0 prelayout=0 dcn=0

      d. Include Diode model parameters by the '.inc' statement;
         .inc '/xxx/xxx/l0040ll_v1p4_1r_dio.mdl'

      e. Include BJT model parameters by the '.inc' statement;
 
        .inc '/xxx/xxx/bjt/pnp11a100ll.mdl'
        (then add the following statement in your netlist to define subcircuit condition you want to simulate.)

        e.g. 1.1V PNP BJT (Emitter Area=10*10^um2)
	xq1 c b e pnp11a100ll_ckt mismod=0


      f. Call resistor macro model subcircuit by the following statement;
         
         .lib '/xxx/xxx/l0040ll_v1p4_1r.lib' DIO_TT
                                              ^^ diode model corner
         .lib '/xxx/xxx/l0040ll_v1p4_1r.lib' RES_TT
                                              ^^ resistor model corner
           
         then add the following statement in your netlist to define  
	 subcircuit condition you want to simulate. 

         e.g. nwell resistor under STI
        
         X1 rnwsti_3t_ckt w=2u l=10u
            
         Where '/xxx/xxx/' is the directory where mdl and lib files are located.  

      g. Call MOS varactor model by the following statement;
         
         .lib '/xxx/xxx/l0040ll_v1p4_1r.lib' VAR_TT
                                              ^^ varactor model corner
         .inc '/xxx/xxx/l0040ll_v1p4_1r.lib' dio_tt
                                              ^^ diode model corner      
         then add the following statement in your netlist to define subcircuit condition
         you want to simulate.
         
         e.g. XCKT 1 2 pvar11ll_ckt lr=10u wr=10u mr=1  

      h. Call MOM capacitor model by the following statement;
         
         .lib '/xxx/xxx/l0040ll_v1p4_1r.lib' MOM_TT
                                              ^^ mom model corner
         then add the following statement in your netlist to define subcircuit condition
         you want to simulate.
         e.g. xc1 1 2 B mom_3t_ckt l=10 nn=10 mm=1 tm=5 bm=1 mismod=1 
         Where 'tm' means top metal, 'bm' means bottom metal,and 'tm' need to <=6, 'bm' should smaller than 'tm'.
	 '/xxx/xxx/' is the directory where mdl and lib files are located.
 
      i. For the pre-layout simulation of mos and 3-T poly resistor model corner by the '.lib' statement;

         Please notice that the library "pre_layout" need to be placed behind tt/ff/ss/fnsp/snfp/mos_mc and res_tt/res_ff/res_ss/res_mc sections to prevent from the redefine(these two flags change back to 0)

         .lib '/xxx/xxx/l0040ll_v1p4_1r.lib' tt
                                          ^^ mos model corner
         .lib '/xxx/xxx/l0040ll_v1p4_1r.lib' res_tt
                                              ^^ resistor model corner  
         ...
         ...

         .lib '/xxx/xxx/l0040ll_v1p4_1r.lib' pre_layout
                                                  ^^ pre-layout simulation 

4. The Capability of Model

   	a. MOS Model 
	*--------------------------------------------------------------*									
	|	MOSFET	type	      | 	name	| Lmin	| Wmin |
	|==============================================================|									
	|	1.1V	NMOS	      |  n11ll_ckt	| 0.04um|0.12um|
	*--------------------------------------------------------------*									
	|	1.1V	PMOS	      |  p11ll_ckt	|0.04um	|0.12um|
	*--------------------------------------------------------------*									
	|   1.1V  Native NMOS 	      |  nt11ll_ckt	| 0.3um	|0.4um |
	*--------------------------------------------------------------*									
	|   1.1V  HVT  NMOS	      |  nhvt11ll_ckt	|0.04um	|0.12um|
	*--------------------------------------------------------------*									
	|   1.1V  HVT  PMOS	      |  phvt11ll_ckt	|0.04um	|0.12um|
	*--------------------------------------------------------------*									
	|   1.1V  LVT  NMOS	      |  nlvt11ll_ckt	|0.04um	|0.12um|
	*--------------------------------------------------------------*									
	|   1.1V  LVT  PMOS	      |  plvt11ll_ckt	|0.04um	|0.12um|
	*--------------------------------------------------------------*									
	|	2.5V  NMOS	      |  n25ll_ckt	|0.27um	|0.32um|
	*--------------------------------------------------------------*									
	|	2.5V  PMOS	      |  p25ll_ckt	|0.27um	|0.32um|
	*--------------------------------------------------------------*									
	|  2.5V Native NMOS	      |  nt25ll_ckt	|1.2um	|0.4um |
	*--------------------------------------------------------------*									
	|  2.5V(OD 3.3V) NMOS	      |  nod33ll_ckt	|0.55um	|0.32um|
	*--------------------------------------------------------------*									
	|  2.5V(OD 3.3V) PMOS	      |  pod33ll_ckt	|0.44um	|0.32um|
	*--------------------------------------------------------------*									
	|  2.5V(OD 3.3V) Native NMOS  |  ntod33ll_ckt	|1.2um	|0.4um |
	*--------------------------------------------------------------*									
	|  2.5V(UD 1.8V) NMOS	      |  nud18ll_ckt	|0.24um	|0.32um|
	*--------------------------------------------------------------*									
	|  2.5V(UD 1.8V) PMOS	      |  pud18ll_ckt	|0.24um	|0.32um|
	*--------------------------------------------------------------*									
	|  2.5V(UD 1.8V) Native NMOS  |  ntud18ll_ckt	|1.2um	|0.4um |
	*--------------------------------------------------------------*									
	|  1.1V NMOS in DNW	      |  n11ll_dnw_ckt  |0.04um |0.12um|
	*--------------------------------------------------------------*									
	|  1.1V HVT NMOS in DNW	      |nhvt11ll_dnw_ckt |0.04um |0.12um|
	*--------------------------------------------------------------*									
	|  1.1V LVT NMOS in DNW	      |nlvt11ll_dnw_ckt |0.04um |0.12um|
	*--------------------------------------------------------------*									
	|  2.5V NMOS in DNW	      | n25ll_dnw_ckt   |0.27um |0.32um|
	*--------------------------------------------------------------*									
	|  2.5V (OD3.3V) NMOS in DNW  | nod33ll_dnw_ckt |0.55um |0.32um|
	*--------------------------------------------------------------*									
	|  2.5V (UD1.8V) NMOS in DNW  | nud18ll_dnw_ckt |0.24um |0.32um|
	*--------------------------------------------------------------*									

  	temperature range:-40C~125C

	b. BJT Model
        *--------------------------------------------------------* 
        |      BJT type     |     name             | Emitter Area|
        |========================================================|
        |   1.1V PNP_10X10  |  pnp12a100ll_ckt     | 10*10 um^2  |
        *--------------------------------------------------------* 
        |   1.1V PNP_5X5    |  pnp12a25ll_ckt      | 5*5 um^2    |
        *--------------------------------------------------------* 
        |   1.1V PNP_2X2    |  pnp12a4ll_ckt       | 2*2 um^2    |
        *--------------------------------------------------------* 
        |   2.5V PNP_10X10  |  pnp25a100ll_ckt     | 10*10 um^2  |
        *--------------------------------------------------------* 
        |   2.5V PNP_5X5    |  pnp25a25ll_ckt      | 5*5 um^2    |
        *--------------------------------------------------------* 
        |   2.5V PNP_2X2    |  pnp25a4ll_ckt       | 2*2 um^2    |
        *--------------------------------------------------------* 
        |   1.1V NPN_10X10  |  npn12a100ll_ckt     | 10*10 um^2  |
        *--------------------------------------------------------* 
        |   1.1V NPN_5X5    |  npn12a25ll_ckt      |  5*5 um^2   |
        *--------------------------------------------------------* 
        |   1.1V NPN_2X2    |  npn12a4ll_ckt       |  2*2 um^2   |
        *--------------------------------------------------------* 
        |   2.5V NPN_10X10  |  npn25a100ll_ckt     |  10*10 um^2 |
        *--------------------------------------------------------* 
        |   2.5V NPN_5X5    |  npn25a25ll_ckt      |  5*5 um^2   |
        *--------------------------------------------------------* 
        |   2.5V NPN_2X2    |  npn25a4ll_ckt       |  2*2 um^2   |
        *--------------------------------------------------------* 
        |   1.1V PNP_10X10  |  pnp12a100ll_sba_ckt | 10*10 um^2  |
        *--------------------------------------------------------*  
        |   1.1V PNP_5X5    |  pnp12a25ll_sba_ckt  | 5*5 um^2    |
        *--------------------------------------------------------* 
        |   1.1V PNP_2X2    |  pnp12a4ll_sba_ckt   | 2*2 um^2    |
        *--------------------------------------------------------* 
        |   2.5V PNP_10X10  |  pnp25a100ll_sba_ckt | 10*10 um^2  |
        *--------------------------------------------------------* 
        |   2.5V PNP_5X5    |  pnp25a25ll_sba_ckt  | 5*5 um^2    |
        *--------------------------------------------------------* 
        |   2.5V PNP_2X2    |  pnp25a4ll_sba_ckt   | 2*2 um^2    |
        *--------------------------------------------------------* 
        |   1.1V NPN_10X10  |  npn12a100ll_sba_ckt | 10*10 um^2  |
        *--------------------------------------------------------* 
        |   1.1V NPN_5X5    |  npn12a25ll_sba_ckt  |  5*5 um^2   |
        *--------------------------------------------------------* 
        |   1.1V NPN_2X2    |  npn12a4ll_sba_ckt   |  2*2 um^2   |
        *--------------------------------------------------------* 
        |   2.5V NPN_10X10  |  npn25a100ll_sba_ckt |  10*10 um^2 |
        *--------------------------------------------------------* 
        |   2.5V NPN_5X5    |  npn25a25ll_sba_ckt  |  5*5 um^2   |
        *--------------------------------------------------------* 
        |   2.5V NPN_2X2    |  npn25a4ll_sba_ckt   |  2*2 um^2   |
        *--------------------------------------------------------* 

        temperature range:-40C~125C

	c. Diode Model   
        *------------------------------------------------* 
        | Junction Diode type |     1.1V     |   2.5V    |  
        |================================================|
        |                     |   ndio11ll   |           |
        |      N+/PWELL       | ndio11llHVT  | ndio25ll  |
        |                     | ndio11llLVT  |           |
        |------------------------------------------------|
        |                     |   pdio11ll   |           |
        |      P+/NWELL       | pdio11llHVT  | pdio25ll  | 
        |                     | pdio11llLVT  |           |
        |------------------------------------------------|
        |   Native N+/Psub    |  ntdio11ll   | ntdio25ll |
        |------------------------------------------------|
        |      Nwell/Pwell    |          nwdioll         |  
        |------------------------------------------------|
        |      n+/rwell       |   dnd11ll    |  dnd25ll  |   
        |------------------------------------------------|
        |    rwell/dnwell     |          rwd11ll         |   
        |------------------------------------------------|
        |     dnwell/psub     |          dnwd11ll        | 
        *------------------------------------------------*
        |     nwell/psub      |parasitic_nwd | (na)      |
        |------------------------------------------------|
        |    rwell/dnwell     |parasitic_rwd | (na)      |
        |------------------------------------------------|
        |     dnwell/psub     |parasitic_dnwd| (na)      |
        *------------------------------------------------*

	temperature range:-40C~125C

        d. Resistor Model
        *--------------------------------------------------------------*  
        |       resistor type                       |   1.1v/2.5v      | 
        |==============================================================|  
        | silicide n+ diffusion (three terminal)    |     rndif_3t_ckt | 
        *--------------------------------------------------------------*  
        | silicide p+ diffusion(three terminal)     |     rpdif_3t_ckt | 
        *--------------------------------------------------------------*  
        | silicide n+ poly (three terminal)         |     rnpo_3t_ckt  | 
        *--------------------------------------------------------------*  
        | silicide p+ poly (three terminal)         |     rppo_3t_ckt  | 
        *--------------------------------------------------------------*  
        | nwell under sti(three terminal)           |     rnwsti_3t_ckt|
        *--------------------------------------------------------------*  
        | nwell under aa  (three terminal)          |     rnwaa_3t_ckt |
        *--------------------------------------------------------------*  
        | non-silicide n+ diffusion(three terminal) |  rndifsab_3t_ckt |
        *--------------------------------------------------------------*  
        | non-silicide p+ diffusion (three terminal)|  rpdifsab_3t_ckt |
        *--------------------------------------------------------------*  
        | non-silicide n+ poly (three terminal)     |    rnposab_3t_ckt|
        *--------------------------------------------------------------*  
        | non-silicide p+ poly (three terminal)     |   rpposab_3t_ckt |
        *--------------------------------------------------------------*  
        | non-silicide hr poly (three terminal)     |   rhrpo_3t_ckt   |
        *--------------------------------------------------------------*  
        | silicide n+ diffusion (two terminal)      |     rndif_2t_ckt | 
        *--------------------------------------------------------------*  
        | silicide p+ diffusion(two terminal)       |     rpdif_2t_ckt | 
        *--------------------------------------------------------------*  
        | silicide n+ poly (two terminal)           |     rnpo_2t_ckt  | 
        *--------------------------------------------------------------*  
        | silicide p+ poly (two terminal)           |     rppo_2t_ckt  | 
        *--------------------------------------------------------------*  
        | nwell under sti(two terminal)             |     rnwsti_2t_ckt|
        *--------------------------------------------------------------*  
        | nwell under aa  (two terminal)            |     rnwaa_2t_ckt |
        *--------------------------------------------------------------*  
        | non-silicide n+ diffusion(two terminal)   |  rndifsab_2t_ckt |
        *--------------------------------------------------------------*  
        | non-silicide p+ diffusion (two terminal)  |  rpdifsab_2t_ckt |
        *--------------------------------------------------------------*  
        | non-silicide n+ poly (two terminal)       |    rnposab_2t_ckt|
        *--------------------------------------------------------------*  
        | non-silicide p+ poly (two terminal)       |   rpposab_2t_ckt |
        *--------------------------------------------------------------*  
        | non-silicide hr poly (two terminal)       |   rhrpo_2t_ckt   |
        *--------------------------------------------------------------*  
        |          metal 1 (two terminal)           |      rm1_2t_ckt  |
        *--------------------------------------------------------------*  
        |          metal 1 (three terminal)         |      rm1_3t_ckt  |
        *--------------------------------------------------------------*  
        |          metal 2 (two terminal)           |      rm2_2t_ckt  |
        *--------------------------------------------------------------*  
        |          metal 2 (three terminal)         |      rm2_3t_ckt  |
        *--------------------------------------------------------------*  
        |          metal 3 (two terminal)           |      rm3_2t_ckt  |
        *--------------------------------------------------------------*  
        |          metal 3 (three terminal)         |      rm3_3t_ckt  |
        *--------------------------------------------------------------*  
        |          metal 4 (two terminal)           |      rm4_2t_ckt  |
        *--------------------------------------------------------------*  
        |          metal 4 (three terminal)         |      rm4_3t_ckt  |
        *--------------------------------------------------------------*  
        |          metal 5 (two terminal)           |      rm5_2t_ckt  |
        *--------------------------------------------------------------*  
        |          metal 5 (three terminal)         |      rm5_3t_ckt  |
        *--------------------------------------------------------------*  
        |          metal 6 (two terminal)           |      rm6_2t_ckt  |
        *--------------------------------------------------------------*  
        |          metal 6 (three terminal)         |      rm6_3t_ckt  |
        *--------------------------------------------------------------*  
        |          metal 7 (two terminal)           |      rm7_2t_ckt  |
        *--------------------------------------------------------------*  
        |          metal 7 (three terminal)         |      rm7_3t_ckt  |
        *--------------------------------------------------------------*  
        |          metal 8 (two terminal)           |      rm8_2t_ckt  |
        *--------------------------------------------------------------*  
        |          metal 8 (three terminal)         |      rm8_3t_ckt  |
        *--------------------------------------------------------------*  
        |        top metal 1 (two terminal)         |      rtm1_2t_ckt |  
        *--------------------------------------------------------------*  
        |        top metal 1 (three terminal)       |      rtm1_3t_ckt |
        *--------------------------------------------------------------*  
        |        top metal 2 (two terminal)         |      rtm2_2t_ckt |  
        *--------------------------------------------------------------*  
        |        top metal 2 (three terminal)       |      rtm2_3t_ckt |
        *--------------------------------------------------------------*  
        | Ultra Thick Tope Metal(two terminal)      |      rutm_2t_ckt |  
        *--------------------------------------------------------------*  
        | Ultra Thick Tope Metal(three terminal)    |      rutm_3t_ckt |  
        *--------------------------------------------------------------*  
        |  alpa (two terminal,thickness=1.45um)     |      ralpa_2t_ckt|
        *--------------------------------------------------------------* 
        |  alpa  (threeterminal,thickness=1.45um)   |      ralpa_3t_ckt|
        *--------------------------------------------------------------*  
        |  alpa (two terminal,thickness=2.8um)      |  ralpa_2p8_2t_ckt|
        *--------------------------------------------------------------* 
        |  alpa  (three terminal,thickness=2.8um)   |  ralpa_2p8_3t_ckt|
        *--------------------------------------------------------------*  
        temperature range:-40C~125C

       e. N+poly/NW MOS Varactor Model
        *---------------------------------------------------------------*
        |   mos varactor subckt   |      1.1v        |       2.5v       |
        |=========================|==================|==================|
        |     n+poly/nwell        |   pvar11ll_ckt   |   pvar25ll_ckt   | 
        *---------------------------------------------------------------*
        |     n+poly/dnwell       | dnwpvar11ll_ckt  |  dnwpvar25ll_ckt | 
        *---------------------------------------------------------------*
        |     p+poly/pwell        |   nvar11ll_ckt   |   nvar25ll_ckt   | 
        *---------------------------------------------------------------*
        |  p+poly/pwell in DNW    |  dnwnvar11ll_ckt |  dnwnvar25ll_ckt | 
        *---------------------------------------------------------------*
        temperature range:-40C~125C

        f.MOM model
        *----------------------------------------------------------------------------------------------*
        |                           40nm MOM Capacitor for 3-terminal and 2-terminal                   |
        *----------------------------------------------------------------------------------------------*
        |   MOM type |     name    |      L    |  Fix Width  |    Fix Space    |       Finger number   | 
        |==============================================================================================|
        |    M1~M6   |   mom_3t_ckt|   4~60um  |   0.07um    |     0.07um      |       20 ~ 400        |
        *--------------------------------------=-------------------------------------------------------*
        |    M1~M6   |   mom_2t_ckt|   4~60um  |   0.07um    |     0.07um      |       20 ~ 400        |
        *--------------------------------------=-------------------------------------------------------*
        temperature range:-40C~125C

   	g. LDMOS Model
	*--------------------------------------------------------------*									
	|	MOSFET	type	      | 	name	| Lmin	| Wmin |
	|==============================================================|									
	|	2.5V N LDMOS          |  nld50ll_ckt	| 0.28um| 2um  |
	*--------------------------------------------------------------*									
	|	2.5V P LDMOS 	      |  pld50ll_ckt	| 0.26um| 2um  |
	*--------------------------------------------------------------*									
	|   2.5V OD3.3V N LDMOS       |  nld50llod_ckt	| 0.28um| 2um  |
	*--------------------------------------------------------------*									
	|   2.5V OD3.3V P LDMOS       |  pld50llod_ckt	|0.26um	| 2um  |
	*--------------------------------------------------------------*									
        temperature range:-40C~125C
 
5. Corner Model 

      Five model corners are provided for MOSFETs, LDMOS.
      three model corners are provided for Diode,
      three model corners are provided for BJT.
      three model corners are provided for RES.
      three model corners are provided for Varactor.
      three model corners are provided for MOM.

      They are
        
      ----------------------------------------------------
      MOS        name : corner
      ----------------------------------------------------
                 TT : Typical case
                 SS : Slow case
                 FF : Fast case
                 SNFP : Slow N Fast P case    
                 FNSP : Fast N Slow P case    
      ----------------------------------------------------
      LDMOS      name : corner
      ----------------------------------------------------
                 LDMOS_TT : Typical case
                 LDMOS_SS : Slow case
                 LDMOS_FF : Fast case
                 LDMOS_FNSP : Slow N Fast P case    
                 LDMOS_SNFP : Fast N Slow P case    
      ----------------------------------------------------
      Diode      name : corner
      ----------------------------------------------------
                 DIO_TT : Typical case
                 DIO_SS : Slow case
                 DIO_FF : Fast case 
      ----------------------------------------------------
      BJT        name : corner
      ----------------------------------------------------
                 BJT_TT : Typical case
                 BJT_SS : Slow case
                 BJT_FF : Fast case 
      ----------------------------------------------------
      RES        name : corner
      ----------------------------------------------------
                 RES_TT : Typical case
                 RES_SS : Slow case
                 RES_FF : Fast case 
      ----------------------------------------------------
      Varactor   name : corner
      ----------------------------------------------------
                 VAR_TT : Typical case
                 VAR_SS : Slow case
                 VAR_FF : Fast case 
      ----------------------------------------------------
      MOM        name : corner
      ----------------------------------------------------
                 MOM_TT : Typical case
                 MOM_SS : Slow case
                 MOM_FF : Fast case 
      ----------------------------------------------------

6. Monte Carlo Statistical model
   Demo netlist
------------------------------------------------------------
*SMIC model verification
.options itl5=0 measdgt=5 post=2 nomod ingold=2
.lib 'l0040ll_v1p4_1r.lib' mos_mc
.temp 25
* assume source at 0
vg1 g1 0 1.1
vd1 d1 0 1.1
vd2 d2 0 1.1
vb b 0 0
xm1 d1 g1 0 b n11ll_ckt w=10u l=0.04u mismod=1
.dc  sweep  monte=500
.print dc  id1=i(vd1)
.end
---------------------------------------------------------------

7. Demo netlist For MOSFET mismatch model (tt corner only)
**********************************************************
* $ SMIC 0.040um Low Leakage Mismatch model demo
.options post=2 nomod ingold=2 
.lib 'l0040ll_v1p4_1r.lib' tt
.temp 25  
 xM1 D1 G1 0 0 n11ll_ckt w=10u l=6e-8 mr=1 nf=1 mismod=1
 xM2 D2 G1 0 0 n11ll_ckt w=10u l=6e-8 mr=1 nf=1 mismod=1
 vD1 D1 0 1.1
 vG1 G1 0 1.1
 vD2 D2 0 1.1
 .dc monte=100
 .print i(vd1) i(vd2)
 .end

8. Demo netlist For Resistor mismatch model (res_tt corner only)
**********************************************************
$ This is a test
.options  post=2 nomod ingold=2 
.lib 'l0040ll_v1p4_1r.lib' res_tt 
.inc 'l0040ll_v1p4_1r_res.ckt'
.temp 25
.param wr=4um lr=60um
Xnposab1 n1 n2 rnposab_3t_ckt w=wr l=lr mismod=1
Xnposab2 n3 n4 rnposab_3t_ckt w=wr l=lr mismod=1
vn1 n1 0 1  
vn2 n2 0 0
vn3 n3 0 1  
vn4 n4 0 0
.dc monte=100
.print dc res1=par('v(n1)/i(vn2)') res2=par('v(n3)/i(vn4)')
.end
9. Demo netlist For MOM capacitor mismatch model (mom_tt corner only)
**********************************************************
$ This is a test
.lib 'l0040ll_v1p4_1r.lib' MOM_tt
.option captab
.param lr=5u nr=35
.temp 25
XC1 1 0 mom_3t_ckt l=5 nn=20 bm=1 tm=2 mm=1 mismod=1
XC2 2 0 mom_3t_ckt l=4 nn=20 bm=1 tm=2 mm=1 mismod=1
V1 1 0 0
R1 1 1 1e-3
R2 1 2 1e-3
.dc monte=100 sweep data=datam
.print dc cap(1) cap(2)
.end

10. Parameter alignment between model, PDK and techfiles.

*=========================================================================================================================================================================================*
|               |      scale         |            flag_cc              |        prelayout            |           mismod           |           globalmod           |        LPEMOD         |
|   Parameters  |--------------------|---------------------------------|-----------------------------|----------------------------|-------------------------------|-----------------------|
|               |(scaling settings)  |coupling capacitance of resistor)|(contact-gate capacitance)   |(mismatch simulation switch)|(global variation simu. switch)|(LPE simulation switch)|
|               |                    |(0=turn off; 1=turn on)          |(0=turn off; 1=turn on)      |(0=turn off; 1=turn on)     |(0=turn off; 1=turn on)        |(0=turn off; 1=turn on)|    
*=========================================================================================================================================================================================*
|     PDK       |ADE scale option=0.9|            default=1            |        default=1            |          default=1         |          default=1            |        default=1      |
|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|      | HSPICE |  scale=0.9         |  default=0  (use additional     |  default=0 (use additional  |          default=1         |          default=1            |        default=1      |
|      |        |                    |  corner to control)             |corner to control)           |                            |                               |                       |
| Model|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|      | Spectre|  scale=0.9         |  default=0  (use additional     |  default=0 (use additional  |          default=1         |          default=1            |        default=1      |
|      |        |                    |  corner to control)             |corner to control)           |                            |                               |                       |
|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|     LVS       |        NA          |            always = 0           |        always = 0           |          default=1         |          default=1            |        default=1      |
|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|     RCX       |  scale=0.9         |  always extract coupling cap    |always extract cont-gate cap |             N/A            |             N/A               |           N/A         |
*=========================================================================================================================================================================================*
