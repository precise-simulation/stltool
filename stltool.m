function stltool()
%  STLTool - STL CAD Geometry Pre-Processing Toolbox for MATLAB®
% ===============================================================
% 
% 
% ![STLTool Screenshot](stltool-screenshot.png)
% 
% 
% About
% -----
% 
% **STLTool** is a MATLAB® toolbox for pre-processing STL CAD geometries
%   for use with the [FEATool Multiphysics](https://www.featool.com)
%   PDE simulation toolbox.
% 
% 
% Features
% --------
% 
% - Supports binary and ascii STL and OBJ CAD geometry formats
% - Polygon reduction using
%   [fast quadratic mesh simplification](https://github.com/sp4cerat/Fast-Quadric-Mesh-Simplification)
%   by Sven Forstmann or alternatively the built-in reducepatch function
% - Boundary and feature identification (saved as different ascii STL
%   solid segments)
% 
% 

% License
% -------
% 
% (C) Copyright 2013-2021 by Precise Simulation Ltd.
% All Rights Reserved.
% 
% STLTool™ and FEATool Multiphysics™ are trademarks of Precise
% Simulation Limited. MATLAB® is a registered trademark of The
% MathWorks, Inc. All other trademarks are the property of their
% respective owners. Precise Simulation Ltd and its products are not
% affiliated with, endorsed, sponsored, or supported by these trademark
% owners.
% 
% Carefully read the included license terms and conditions before
% installing or using the programs or documentation. Installing or using
% the programs means you have accepted and agree to be bound by the
% terms and conditions of this agreement. if you do not accept them,
% uninstall, remove and completely delete the programs and
% documentation.
% 
% Third Party licenses include the _Fast Quadric Mesh Simplification_
% Copyright (C) 2015-2019 Sven Forstmann, MIT License.

% PRECISE SIMULATION LIMITED LICENSE
% 
% IMPORTANT NOTICE
% 
% READ THE TERMS AND CONDITIONS OF THIS PRECISE SIMULATION LIMITED
% LICENSE AGREEMENT (THE "AGREEMENT") CAREFULLY BEFORE ACCESSING THESE
% MATERIALS (AS DEFINED BELOW).
% 
% THIS AGREEMENT REPRESENTS THE ENTIRE AGREEMENT BETWEEN YOU (THE
% "LICENSEE") AND THE PRECISE SIMULATION, LTD. ("PRECISE SIMULATION")
% CONCERNING THE SOFTWARE AND DOCUMENTATION MADE AVAILABLE FOR ACCESS
% HEREUNDER (COLLECTIVELY, THE "MATERIALS").
% 
% BY ACCESSING THESE MATERIALS, YOU ACCEPT THE TERMS OF THIS AGREEMENT.
% 
% 1. DEFINITIONS.
% 
%     1.1. "Licensee" means you, whether an individual or an entity, to
%          whom Precise Simulation grants the License, and who is
%          responsible for complying with the contractual obligations of
%          the License, and ensuring that anyone permitted access to the
%          Materials also complies with such obligations.
% 
%     1.2. "Documentation" means the user guides, if any, accompanying
%          delivery of the Materials, as may be updated from time to
%          time, as well as any reports or other feedback that Precise
%          Simulation may, in its sole discretion, provide to Licensee.
%          Documentation may be delivered in printed and/or online
%          forms, and in one or more languages.
% 
%     1.3. "Licensor" means any person who, or entity which, grants a
%          license to Precise Simulation to redistribute that person's
%          or entity's intellectual property.
% 
%     1.4. "Materials" means the computer software delivered and
%          licensed hereunder, including Documentation, enhancements and
%          error corrections.
% 
%     1.5. "Third Party" means any person or legal entity that is not
%          Precise Simulation or the Licensee.
% 
% 2. LICENSE GRANT.  Precise Simulation hereby grants to Licensee,
%    subject to the terms of this Agreement, a nonexclusive,
%    nontransferable, revocable license (the "License") to use the
%    Materials internally or for the purpose of providing to Precise
%    Simulation engineering feedback on the Materials, as the context
%    may require.  In all cases, the Materials are licensed to you
%    solely for use in conjunction with Precise Simulation products and
%    services.
% 
% 3. LICENSE RESTRICTIONS.  The License is subject to the express
%    restrictions set forth below. Licensee shall not, and shall not
%    permit any Third Party to:
% 
%     3.1. modify, or create any derivative work of, any part of the
%          licensed Materials
% 
%     3.2. adapt, translate, copy, or convert all or any part of the
%          Materials in order to create software or other materials, a
%          principal purpose of which is (a) to perform the same or
%          similar functions as the Materials or any other technology or
%          materials licensed by Precise Simulation, or (b) to replace
%          any component of the Materials or any other technology or
%          materials licensed by Precise Simulation;
% 
%     3.3. rent, lease, or loan the Materials; use the Materials for
%          supporting Third Parties' use of the Materials, time share
%          the Materials, or provide service bureau use;
% 
%     3.4. disassemble, decompile, reverse engineer the Materials or
%          otherwise attempt to gain access to its method of operation
%          or source code (other than files provided for convenience in
%          source code form by Precise Simulation);
% 
%     3.5. sell, license, sublicense, publish, display, distribute,
%          disseminate, assign, or otherwise transfer (whether by sale,
%          exchange, lease, gift, or otherwise) to a Third Party the
%          Materials, any copy or portion thereof, or any License or
%          other rights thereto, in whole or in part, without Precise
%          Simulation' prior written consent;
% 
%     3.6. alter, remove, or obscure any copyright, trade secret,
%          patent, trademark, logo, proprietary and/or other legal
%          notices on or in copies of the Materials;
% 
%     3.7. use Precise Simulation' name, trade names, logos, or other
%          trademarks of Precise Simulation or any of its affiliates or
%          Licensors in any advertising, promotional literature or any
%          other material, whether in written, electronic, or other
%          form, distributed to any Third Party, except in the form
%          provided by Precise Simulation, and then solely for purposes
%          of identifying Precise Simulation' Materials;
% 
%     3.8. provide access (directly or indirectly) to the Materials via
%          a web or network application other than the licensee's
%          internal network;
% 
%     3.9. copy, make available for copy, or otherwise reproduce the
%          Materials, in whole or in part, except either (a) as may be
%          required for their installation into computer memory for the
%          purpose of executing the Materials in accordance with this
%          Agreement; or (b) to make a reasonable number of copies
%          solely for back-up purposes provided that any such permitted
%          copies shall reproduce all copyright, trade secret, patent,
%          logo, proprietary and/or other legal notices contained in the
%          original copy obtained from Precise Simulation; and/or
%          3.10. republish the Documentation.
% 
% 4. RETENTION OF RIGHT, TITLE AND INTEREST BY PRECISE SIMULATION AND
%    ITS LICENSORS; CONFIDENTIALITY.  The Materials shall at all times
%    remain the property of Precise Simulation and/or its Licensors and
%    Licensee shall have no right, title, or interest therein, except as
%    expressly set forth in this Agreement.  The Materials are a
%    commercially valuable product of Precise Simulation, the design and
%    development of which reflect the efforts of skilled development
%    experts and the investment of considerable time and
%    expense. Precise Simulation claims and reserves all rights and
%    benefits afforded under all relevant laws and regulations. Licensee
%    shall take appropriate action by instruction, agreement, or
%    otherwise with any persons permitted access to the Materials, so as
%    to enable Licensee to satisfy its obligations under the terms of
%    this Agreement.  The Materials are proprietary information of
%    Precise Simulation, and are protected by copyright law, trade
%    secret law and other applicable law.  Although Precise Simulation
%    may consider a commercial release of the Materials, it is under no
%    obligation to do so and Precise Simulation reserves the right to
%    alter features, licensing terms, or other characteristics of any
%    such commercial release.
% 
% 5. LICENSES FOR THIRD PARTY SOFTWARE.  Precise Simulation has been
%    granted licenses to distribute certain Third Party software.
%    Certain Precise Simulation Materials require the use of Third Party
%    software products that may require a separate license from such
%    Third Parties to use those Third Party products. Licensee agrees
%    and acknowledges that, to the extent that the Materials contain any
%    Third Party software: (i) such Third Party software is provided on
%    an "as-is", pass-through basis, and as such is provided to Licensee
%    without warranty, indemnification, support or other representation
%    by Precise Simulation; and (ii) Precise Simulation bears no
%    liability with respect to such Third Party software.
% 
% 6. TERM AND TERMINATION.  This Agreement shall continue until
%    termination by Precise Simulation or Licensee as provided below.
%    Either party may terminate this Agreement at any time, for any
%    reason, upon written notice to the other party.  Upon termination,
%    Licensee shall promptly return all but archival copies of the
%    Materials in Licensee's possession or control, or promptly provide
%    written certification of their destruction.
% 
% 7. EXPORT CONTROL.  The Materials may be subject to U.S. export
%    control laws or other (U.S. and non-U.S.) governmental export and
%    import laws and regulations.  Notwithstanding any other term of
%    this Agreement or Third Party agreement, Licensee's rights under
%    this Agreement may not be exercised by Licensee or any Third Party
%    in violation of such laws and regulations, nor may this Agreement
%    be transferred to any party where doing so would result in such a
%    violation.  The terms of any limitation on the use, transfer or
%    re-export of the Materials imposed by Precise Simulation in any
%    Destination Control Statement or other document for the purpose of
%    export control shall prevail over any term in this Agreement.  It
%    shall be Licensee's responsibility to comply with the latest United
%    States or other governmental export and import regulations.
% 
% 8. FEDERAL ACQUISITION.  This provision applies to all acquisitions of
%    the Materials and Documentation by, for, or through the federal
%    government of the United States.  By accepting delivery of the
%    Materials or Documentation, the government hereby agrees that this
%    software or documentation qualifies as commercial computer software
%    or commercial computer software documentation as such terms are
%    used or defined in FAR 12.212, DFARS Part 227.72, and DFARS
%    252.227-7014.  Accordingly, the terms and conditions of this
%    Agreement and only those rights specified in this Agreement, shall
%    pertain to and govern the use, modification, reproduction, release,
%    performance, display, and disclosure of the Materials and
%    Documentation by the federal government (or other entity acquiring
%    for or through the federal government) and shall supersede any
%    conflicting contractual terms or conditions.  If this License fails
%    to meet the government's needs or is inconsistent in any respect
%    with federal procurement law, the government agrees to return the
%    Materials and Documentation, unused, to Precise Simulation.
% 
% 9. FOR EUROPEAN UNION LICENSEES ONLY.  Any contractual provisions of
%    this Agreement contrary to laws implemented under Article 6 of
%    Appendix V of the European Union Software Directive or to the
%    exceptions provided for in Article 5(2) and (3) of such Appendix
%    shall be null and void solely to the extent decompiling,
%    disassembling, or otherwise reverse-engineering of the Materials is
%    necessary to enable the Licensee to create an independent program
%    that is interoperable with the Materials or any other permitted
%    objectives specified by such laws implemented under such directive
%    (collectively, the "Permitted Objectives"), provided that any such
%    information gained is used solely for such Permitted Objectives.
% 
% 10. ASSIGNMENT.  Licensee may not assign or otherwise transfer this
%     Agreement and its rights and obligations hereunder, in whole or in
%     part, by operation of law or otherwise, without the written
%     consent of Precise Simulation. In the case of any permitted
%     assignment or transfer of or under this Agreement, this Agreement
%     or the relevant provisions shall be binding upon, and inure to the
%     benefit of, the successors, executors, heirs, representatives,
%     administrators and assigns of the parties hereto. Precise
%     Simulation may charge Licensee an administrative fee for any
%     permitted assignment.
% 
% 11. LIMITATION OF LIABILITY.  The Materials should not be relied on as
%     the sole basis to solve a problem or implement a design whose
%     incorrect solution or implementation could result in injury to
%     person or property.  If the Materials are employed in such a
%     manner, it is at the Licensee's own risk and Precise Simulation
%     and its Licensors explicitly disclaim all liability for such
%     misuse to the extent allowed by law.  Precise Simulation' and its
%     Licensors' liability for death or personal injury resulting from
%     negligence or for any other matter in relation to which liability
%     by law cannot be excluded or limited shall not be excluded or
%     limited.  Except as aforesaid, (a) any other liability of Precise
%     Simulation and its Licensors (whether in relation to breach of
%     contract, negligence or otherwise) shall not in total exceed one
%     hundred dollars ($100.00); and (b) Precise Simulation and its
%     Licensors shall have no liability for any indirect or
%     consequential loss (whether foreseeable or otherwise and including
%     loss of profits, loss of business, loss of opportunity, and loss
%     of use of any computer hardware or software).  Some states do not
%     allow the exclusion or limitation of incidental or consequential
%     damages, so the above exclusion or limitation may not apply to
%     Licensee.
% 
% 12. DISCLAIMER OF WARRANTIES.  The Materials are delivered "as is" and
%     Precise Simulation makes and the Licensee receives no additional
%     express or implied warranties.  Precise Simulation and its
%     Licensors hereby expressly disclaim any and all other conditions,
%     warranties, or other terms of any kind or nature concerning the
%     Materials (including, without limitation, any with regard to
%     infringement, merchantability, quality, accuracy, or fitness for a
%     particular purpose or Licensee's purpose).  Precise Simulation
%     also expressly disclaims any warranties that may be implied from
%     usage of trade, course of dealing, or course of performance.  The
%     Materials are provided with all faults, and the entire risk of
%     satisfactory quality, performance, accuracy, and effort is with
%     Licensee.  Precise Simulation does not warrant that the Materials
%     will operate without interruption or be error free.  Some states
%     and countries do not allow limitations on how long an implied
%     warranty lasts, so the above limitation may not apply to Licensee.
%     Licensee may also have other rights which vary from state to state
%     and country to country. Licensee accepts responsibility for its
%     use of the Materials and the results obtained therefrom.
% 
% 13. GOVERNING LAW; JURISDICTION.  This Agreement shall be interpreted,
%     enforced and construed and the rights of the parties hereunder
%     governed in all respects by the laws of the Commonwealth of
%     Massachusetts, United States of America, without regard to its
%     conflicts of law provisions, and both parties consent to the
%     jurisdiction of the federal and state courts located in said
%     Commonwealth and consent to the service of process, pleadings and
%     notices in connection with any and all actions initiated in such
%     courts.  The parties agree that a final judgment in any such
%     action or proceeding shall be conclusive and binding and may be
%     enforced in any other jurisdiction.  To the extent any governing
%     law, treaty, or regulation is in conflict with this Agreement, the
%     conflicting terms of this Agreement shall be superseded only to
%     the extent necessary by such law, treaty, or regulation.  If any
%     provision of this Agreement shall be otherwise unlawful, void, or
%     otherwise unenforceable, that provision shall be enforced to the
%     maximum extent permissible.  In either case, the remainder of this
%     Agreement shall not be affected.  The parties agree that the
%     U.N. Convention on Contracts for the International Sale of Goods
%     shall not apply to this Agreement.  The parties further agree that
%     the Uniform Computer Information Transactions Act, or any version
%     thereof, adopted by any state, in any form ("UCITA"), shall not
%     apply to this Agreement.  To the extent that UCITA is applicable,
%     the parties agree to opt out of the applicability of UCITA
%     pursuant to the Opt-Out provision(s) contained therein.
% 
% 14. HEADINGS.  The inclusion of headings is for convenience of
%     reference only and shall not affect the construction or
%     interpretation of this Agreement.
% 
% 15. ENTIRE AGREEMENT.  This Agreement, together with any additional
% license_addendum.txt file included with the Materials, contains the
% entire understanding of the parties with regard to the Materials, and
% may not be modified or amended except by written instrument, executed
% by authorized representatives of Precise Simulation and Licensee.
