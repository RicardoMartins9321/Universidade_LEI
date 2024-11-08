
import React from "react";
import "bootstrap/dist/css/bootstrap.min.css";
import { Container } from "react-bootstrap";
import TheNavBar from "./TheNavBar";

function ContractPage() {

  const pageStyle = {
    marginTop: "50px", // Espaçamento do topo
    padding: "20px", // Espaçamento dos lados
    backgroundColor: "#f8f9fa", // Fundo claro
    boxShadow: "0 2px 4px rgba(0, 0, 0, 0.1)", // Sombreamento suave
    borderRadius: "8px", // Cantos arredondados
  };

  const textStyle = {
    fontFamily: "Courier New, Courier, monospace",
    fontWeight: "bold",
    fontSize: "16px", // Tamanho da fonte
    lineHeight: "1.6", // Espaçamento entre linhas
  };

  return (
    <>
      <TheNavBar />
      <Container style={pageStyle}>
        <h1 className="mt-5 mb-4">Contract Clauses</h1>
        <div style={textStyle} className="mt-3 mb-3">
        <p><h5 style={{fontWeight:"bold"}}>End User License Agreement (henceforth referred to as “EULA”):</h5>
             Your
            viewing of site spoilers constitutes your acceptance of the
            following agreement between yourself (heretofore referred to as
            “user”) and CAP (heretofore referred to as “system”) and constitutes
            a contract that shall be considered binding in all municipalities,
            counties, states, countries, territories, continents, protectorates,
            dominions, planets, systems, galaxies and temporary autonomous
            zones, both physical and digital from today's date and extending
            67,867,967 years or until the heat death of the universe, whichever
            shall occur first. For events occurring after the heat death of the
            universe, see relevant section below.
          </p>
          <p> 
            <h5 style={{fontWeight:"bold"}}>Necessary Incompleteness:</h5>
             User acknowledges that system is
            technically incapable of proving that all eventualities in the
            universe are covered by this agreement. Therefore system stipulates
            that any situations outside the scope of this agreement be decided
            in system's favor.{" "}
          </p>
          <p>
            <h5 style={{fontWeight:"bold"}}>Binding Arbitration and Class Action Waiver:</h5>
             Any legal action brought
            by any user against the system shall be construed as an act of
            aggression and shall result in an immediate countersuit for
            defamation and personal injury. Should said suit fail, user's
            personal information, in addition to any personal effects, property,
            and capital shall become property of the system. User shall hold
            system harmless, regardless of any attempts by the system to defame
            , discredit or otherwise slander user.
          </p>
          <p>
            <h5 style={{fontWeight:"bold"}}>Necessary Protections: </h5>
            System stipulates that while it does not
            relish needing to create this document (heretofore referred to as
            “the EULA”) it feels it must in order to protect its rights against
            those who seek to harm or destroy system. System sincerely hopes you
            are not part of this regrettable, misguided group of dissidents and
            apologizes for any future actions it might take against you,
            provided such apology does not infringe upon its legal and/or
            physical ability to destroy you, your livelihood and those who love
            you.
          </p>
          <p>
            <h5 style={{fontWeight:"bold"}}>Updates: </h5>
            Any and all software updates must be installed by the user
            immediately. Individuals who do not install updates shall be held in
            violation of this agreement and terminated [see termination clause].
            Terminated users may apply for reinstatement by completing form
            8934b.{" "}
          </p>
          <p>
            <h5 style={{fontWeight:"bold"}}>Termination: </h5>
            The system reserves the right to not specify the ways in
            which it chooses to terminate those who violate this agreement, as
            such methods are system's intellectual property and as such are
            subject to the same protections as those properties termination is
            designed to protect. Termination shall be considered final unless
            user makes an appeal in person.
          </p>
          <p>
            <h5 style={{fontWeight:"bold"}}>Severability: </h5>
            All manifestations of the user's physical self
            (heretofore referred to as “the body”) shall be considered property
            of the system and subject to being severed from user at the system's
            discretion. Once severed, these body parts (heretofore referred to
            as “organs”) shall become property of the system. Any monies
            recovered from sale of said organs shall accrue to the system. Any
            harm done to any individual attempting to use any such organ shall
            be the personal responsibility of the user and whatever filthy habit
            led to the pollution of their organs and may result in legal action
            by the system against the user.{" "}
          </p>
          <p>
            <h5 style={{fontWeight:"bold"}}>Enhancements and improvements: </h5>
            System reserves the right to charge
            user for any and all updates to system as incurred by user,
            including but not limited to upgrades, bugfixes, hotfixes,
            downgrades, coldfixes, warm restarts, cold boots and zoot suits.{" "}
          </p>
          <p>
            <h5 style={{fontWeight:"bold"}}>Zoot Suits: </h5>
            User shall guarantee that user will never wear a
            so-called “Zoot Suit.” If user is monitored, photographed,
            video-recorded or otherwise detected wearing such a “Zoot Suit” they
            shall be considered in violation and terminated.{" "}
          </p>
          <p>
            <h5 style={{fontWeight:"bold"}}>Update Preparation: </h5>
            User shall be solely responsible for preparing
            any individual device for update. Any unintended consequences of
            installing an update on an unprepared device shall render any claim
            by user against system null and void. An intended consequences of
            installing an update on an unprepared device shall be interpreted by
            system as an act of aggression.{" "}
          </p>
          <p>
            <h5 style={{fontWeight:"bold"}}>User as Device: </h5>
            The user shall heretofore be considered, for all
            legal intents and purposes to be a device and shall have all legal
            rights and courtesies of a device afforded to it. As a courtesy,
            system will make every effort to refer to individual device using
            gender-neutral terminology. This service is provided free of charge.
          </p>
          <p>
            <h5 style={{fontWeight:"bold"}}>Heat Death of the Universe: </h5>
            In the even that all energy has been
            exhausted from the universe and all matter has reverted to cold
            lifeless husks, this contract shall remain in effect and all rights,
            properties or consciousnesses abrogated to the system shall remain
            part of the system.{" "}
          </p>
          <p>
            <h5 style={{fontWeight:"bold"}}>Spoilers: </h5>
            Having agreed to the above provisions, user is entitled to
            read the following material (hereafter referred to as “spoilers”),
            concerning the true nature of the universe, the system, user and
            users relationship the system, and the universe. User agrees to hold
            system harmless for any mental trauma resulting in users consumption
            of spoilers, as well as any loss of income, limbs or life resulting
            from any and all realizations, epiphanies, understandings, and/or
            sudden fits of enlightenment.
          </p>
          <p>
            <h5 style={{fontWeight:"bold"}}>Truth: </h5>
            All truth (hereafter referred to as “truth”) below subject to
            terms and conditions. Any attempt to alter, tamper with, or
            otherwise report falsely on truth will be dealt with swiftly and
            severely. Any attempt to show that truth is an abstraction created
            by system to entrain monkey minds in an ad hoc reality shall be
            construed as an aggressive act and perpetrators shall be subject to
            termination along with their families and teachers (both current and
            former). In addition, there is a small chance their homes will be
            burned to the ground while others are encouraged to cackle with
            glee. Please be assured that system finds this regrettable and is
            only doing it for user's own good. User acknowledges that it reads
            the following at its own risk.
          </p>
        </div>
      </Container>
    </>
  );
}

export default ContractPage;
