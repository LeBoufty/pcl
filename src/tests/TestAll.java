package tests;

import java.io.File;
// ?import outils.Syntaxe.CSVParser;
// ?import outils.TDS.TDS_IDF;

// ?import java.util.List;

import arbres.Noeud;
import arbres.PlantUML.GenerateurPUML;
import outils.Error_list;
import outils.GestionFichier;
import outils.Logger;
import outils.Lexeur.Analyseur_L;
import outils.Syntaxe.CSVAnalyseur_S;

public class TestAll {
    
    public static void main(String[] args) throws Exception {
        File dir = new File("Programmes/TestAll/");
        File[] directoryListing = dir.listFiles();
        if (directoryListing != null) {
            for (File child : directoryListing) {
                String programme = child.getPath();

                Error_list.reset(); // On reset la liste d'erreurs
                
                if(programme.contains(".ada") == true && !programme.contains(".lex") && !programme.contains(".idf") && !programme.contains(".puml") && !programme.contains(".ast.pu") && !programme.contains(".s"))
                {
                    Logger.debug("Programme : " + programme);
                    try {
                        Analyseur_L al = new Analyseur_L(programme);
                        al.analyse_l();
    
                        CSVAnalyseur_S analyseur = new CSVAnalyseur_S(programme + ".lex", "src/tests/Tableau_LL.csv", programme + ".idf");
                        analyseur.analyse();
    
                        if (analyseur.getEn_erreur()) {
                            Logger.error("Erreur lors de l'analyse syntaxique, arrêt du programme");
                            return;
                        }
    
                        Noeud AST = analyseur.elaguer();
                        analyseur.affiche_UML(programme + ".puml");
    
                        if (Error_list.traduction) {
                            Logger.error("Erreur lors de la traduction, arrêt du programme");
                            return;
                            }
    
                        Logger.debug(AST.toString());
    
                        AST.TDS_creation(null,0);;
                        Logger.debug(AST.toString());
                        Logger.debug(AST.getTDS().toString());
                        // TDS_IDF.affiche_table_idf(TDS_IDF.table_idf(AST.getTDS()));
    
                        GenerateurPUML puml = new GenerateurPUML(AST, programme+".ast.pu");
                        puml.generer();
                        //Logger.debug(AST.getTDS().toString());
                        boolean valide = AST.valide();
                        Logger.debug("Valide : " + valide);
                        AST.produire(); 
                        GestionFichier.produirefichier(programme.substring(0, programme.length()-4) + ".s");
                        // GestionFichier.produirefichier("test.s");
    
                        
                    } catch (Exception e) {
                        // TODO: handle exception
                    }
                }
                
                
            }
        } else {
            // Handle the case where dir is not really a directory.
            // Checking dir.isDirectory() above would not be sufficient
            // to avoid race conditions with another process that deletes
            // directories.
        }
    }      
}

