package arbres.PlantUML;

import java.util.ArrayList;

import arbres.*;
import outils.Logger;

public class NoeudUML {
    private static ArrayList<String> nomsAttribues = new ArrayList<String>();
    private String valeur;
    private String titre;
    private ArrayList<NoeudUML> enfants;

    public NoeudUML(String valeur) {
        // Pour éviter la merdouille dans le diagramme, tous les noms doivent être uniques.
        this.titre = valeur;
        valeur = rendreUnique(valeur);
        nomsAttribues.add(valeur);
        this.valeur = valeur;
        enfants = new ArrayList<NoeudUML>();
        Logger.info("Noeud "+this.valeur+" créé");
    }

    public NoeudUML(Noeud n) {
        // Chaque noeud est unique, on doit tout gérer individuellement.
        // Je vais aller dans les grandes lignes.
        switch (n.getClass().getSimpleName()) {
            case "Affectation": // Si c'est une affectation...
                // On donne un joli titre !!
                this.titre = "Affectation";
                // On récupère l'objet Affectation
                Affectation a = (Affectation) n;
                // On lui attribue un nom unique
                this.valeur = Repertoire.getNewID(a);
                nomsAttribues.add(this.valeur);
                // On crée une liste d'enfants
                enfants = new ArrayList<NoeudUML>();
                // On génère les noeuds des enfants.
                // (C'est récursif)
                enfants.add(new NoeudUML(a.gauche));
                enfants.add(new NoeudUML(a.droite));
                break;
            case "Declaration":
                this.titre = "Déclaration";
                Declaration i = (Declaration) n;
                this.valeur = Repertoire.getNewID(i);
                nomsAttribues.add(this.valeur);
                enfants = new ArrayList<NoeudUML>();
                enfants.add(new NoeudUML(i.variable));
                enfants.add(new NoeudUML(i.type.toString()));
                break;
            case "Parametre":
                this.titre = "Paramètre";
                Parametre p = (Parametre) n;
                this.valeur = Repertoire.getNewID(p);
                nomsAttribues.add(this.valeur);
                enfants = new ArrayList<NoeudUML>();
                enfants.add(new NoeudUML(p.variable));
                enfants.add(new NoeudUML(p.type.toString()));
                break;
            case "Champ":
                this.titre = "Champ";
                Champ ch = (Champ) n;
                this.valeur = Repertoire.getNewID(ch);
                nomsAttribues.add(this.valeur);
                enfants = new ArrayList<NoeudUML>();
                enfants.add(new NoeudUML(ch.variable));
                enfants.add(new NoeudUML(ch.type.toString()));
                break;
            case "Variable":
                Variable v = (Variable) n;
                this.valeur = rendreUnique(v.nom);
                this.titre = v.nom;
                nomsAttribues.add(this.valeur);
                enfants = new ArrayList<NoeudUML>();
                break;
            case "AppelFonction":
                this.titre = "Appel Fonction";
                AppelFonction af = (AppelFonction) n;
                this.valeur = Repertoire.getNewID(af);
                nomsAttribues.add(this.valeur);
                enfants = new ArrayList<NoeudUML>();
                enfants.add(new NoeudUML(af.fonction.nom));
                for (Evaluable e : af.params) {
                    enfants.add(new NoeudUML(e));
                }
                break;
            case "Fonction":
                this.titre = "Fonction";
                Fonction f = (Fonction) n;
                this.valeur = Repertoire.getNewID(f);
                nomsAttribues.add(this.valeur);
                enfants = new ArrayList<NoeudUML>();
                enfants.add(new NoeudUML(f.nom));
                for (Instanciation v2 : f.params) {
                    enfants.add(new NoeudUML(v2));
                }
                enfants.add(new NoeudUML(f.type.toString()));
                enfants.add(new NoeudUML(f.definitions));
                enfants.add(new NoeudUML(f.instructions));
                break;
            case "Bloc":
                this.titre = "Bloc";
                Bloc b = (Bloc) n;
                this.valeur = Repertoire.getNewID(b);
                nomsAttribues.add(this.valeur);
                enfants = new ArrayList<NoeudUML>();
                for (Noeud n2 : b.instructions) {
                    enfants.add(new NoeudUML(n2));
                }
                break;
            case "InstructionIf":
                this.titre = "If";
                InstructionIf iif = (InstructionIf) n;
                this.valeur = Repertoire.getNewID(iif);
                nomsAttribues.add(this.valeur);
                enfants = new ArrayList<NoeudUML>();
                enfants.add(new NoeudUML(iif.condition));
                enfants.add(new NoeudUML(iif.alors));
                enfants.add(new NoeudUML(iif.sinon));
                break;
            case "InstructionWhile":
                this.titre = "While";
                InstructionWhile iw = (InstructionWhile) n;
                this.valeur = Repertoire.getNewID(iw);
                nomsAttribues.add(this.valeur);
                enfants = new ArrayList<NoeudUML>();
                enfants.add(new NoeudUML(iw.condition));
                enfants.add(new NoeudUML(iw.corps));
                break;
            case "InstructionFor":
                this.titre = "For";
                InstructionFor iff = (InstructionFor) n;
                this.valeur = Repertoire.getNewID(iff);
                nomsAttribues.add(this.valeur);
                enfants = new ArrayList<NoeudUML>();
                enfants.add(new NoeudUML(iff.iterateur));
                enfants.add(new NoeudUML(iff.borneInf));
                enfants.add(new NoeudUML(iff.borneSup));
                enfants.add(new NoeudUML(iff.corps));
                break;
            case "Constante":
                Constante c = (Constante) n;
                this.valeur = rendreUnique(c.toString());
                this.titre = c.toString();
                nomsAttribues.add(this.valeur);
                enfants = new ArrayList<NoeudUML>();
                break;
            case "Operation":
                this.titre = "Operation";
                Operation o = (Operation) n;
                this.valeur = Repertoire.getNewID(o);
                nomsAttribues.add(this.valeur);
                enfants = new ArrayList<NoeudUML>();
                enfants.add(new NoeudUML(o.gauche));
                // On prend le nom de l'opérateur parce que = fout la merde.
                enfants.add(new NoeudUML(o.getOperateur().name()));
                enfants.add(new NoeudUML(o.droite));
                break;
            case "OperationUnaire":
                this.titre = "Operation Unaire";
                OperationUnaire ou = (OperationUnaire) n;
                this.valeur = Repertoire.getNewID(ou);
                nomsAttribues.add(this.valeur);
                enfants = new ArrayList<NoeudUML>();
                enfants.add(new NoeudUML(ou.getOperateur().name()));
                enfants.add(new NoeudUML(ou.droite));
                break;
            case "Procedure":
                this.titre = "Procedure";
                Procedure pr = (Procedure) n;
                this.valeur = Repertoire.getNewID(pr);
                nomsAttribues.add(this.valeur);
                enfants = new ArrayList<NoeudUML>();
                enfants.add(new NoeudUML(pr.nom));
                enfants.add(new NoeudUML(pr.definitions));
                enfants.add(new NoeudUML(pr.instructions));
                break;
            case "Return":
                this.titre = "Return";
                Return r = (Return) n;
                this.valeur = Repertoire.getNewID(r);
                nomsAttribues.add(this.valeur);
                enfants = new ArrayList<NoeudUML>();
                enfants.add(new NoeudUML(r.valeur));
                break;
            case "Acces":
                Acces ac = (Acces) n;
                this.titre = ac.toString();
                this.valeur = Repertoire.getNewID(ac);
                nomsAttribues.add(this.valeur);
                enfants = new ArrayList<NoeudUML>();
                break;
            case "Record":
                this.titre = "Record";
                Struct s = (Struct) n;
                this.valeur = Repertoire.getNewID(s);
                nomsAttribues.add(this.valeur);
                enfants = new ArrayList<NoeudUML>();
                enfants.add(new NoeudUML(s.nom));
                for (Champ champ : s.champs) {
                    enfants.add(new NoeudUML(champ));
                    enfants.add(new NoeudUML(champ.type.toString()));
                }
                break;
            case "Struct":
                Struct st = (Struct) n;
                this.valeur = rendreUnique(st.toString());
                this.titre = st.toString();
                nomsAttribues.add(this.valeur);
                enfants = new ArrayList<NoeudUML>();
                break;
            case "Pointeur":
                Pointeur p2 = (Pointeur) n;
                this.valeur = rendreUnique(p2.toString());
                this.titre = p2.toString();
                nomsAttribues.add(this.valeur);
                enfants = new ArrayList<NoeudUML>();
                enfants.add(new NoeudUML(p2.type.toString()));
                break;
            default:
                // Cas par défaut, on sait jamais.
                this.valeur = Repertoire.getNewID(n);
                nomsAttribues.add(this.valeur);
                Logger.warn("Noeud "+this.valeur+" : non reconnu");
                enfants = new ArrayList<NoeudUML>();
                break;
        }
        Logger.info("Noeud "+this.valeur+" créé");
    }
    private String rendreUnique(String nom) {
        String nomUnique = nom;
        while (nomsAttribues.contains(nomUnique)) {
            // On ajoute un underscore tant que le nom n'est pas unique.
            nomUnique += "_";
        }
        return nomUnique;
    }
    // Une bande de getters et de setters au cas où.
    public String getValeur() {
        return valeur;
    }
    public void setValeur(String valeur) {
        this.valeur = valeur;
    }
    public void ajouterEnfant(NoeudUML enfant) {
        enfants.add(enfant);
    }
    public void ajouterEnfants(ArrayList<NoeudUML> enfants) {
        this.enfants.addAll(enfants);
    }
    public ArrayList<NoeudUML> getEnfants() {
        return enfants;
    }
    // La définition en PlantUML du noeud.
    public String definition() {
        return "object \""+this.titre+"\" as "+this.valeur+"\n";
    }
    // Les relations en PlantUML du noeud.
    public String relations() {
        String sortie = "";
        for (NoeudUML noeudUML : enfants) {
            sortie += this.valeur + " -down-> " + noeudUML.getValeur() + "\n";
        }
        return sortie;
    }
}

