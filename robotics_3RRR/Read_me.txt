GENERAL DIRECTIONS

1. Copy all the files in a folder. 
(PRR3_GUI_2.m, PRR3_GUI_2.fig, PRR3_ForwardPosKin.m, PRR3_InversePosKin.m, PRR3_Manipulator_Display.m, PRR3_Manipulator_Display_Plot.m)

2. Execute file PRR3_GUI_2.m.

3. Always look for the status of the program in the status window. 
   In case the program shows "Evaluating Please Wait!" wait until status changes.

4. Reset the GUI after every operation.

5. In order to perform analysis of unsymmetric manipulator reset and then set the manipulator geometry parameters before any operation. (Resetting sets every parameter to initial state) 


PANEL SPECIFIC DIRECTIONS

1. Forward Kinematics can be tested from the Forward Kinematics Panel located in the top right corner of the GUI. Click on the slider to change the values.
 
2. Inverse Kinematics can be tested from the Inverse Kinematics panel located in the middle right section of the GUI. Click on the slilder to change the values. 

3. Manipulator Geometry variation can be tested from the Manipulator Parameters panel located in the bottom right corner of the GUI. Click on the slilder to change the values. 

4. Manipulability Analysis can be carried out using the Manipulability Analysis Panel located in the top left corner of the GUI. The limits of evaluation are read from the current Workspace Size in the Workspace Size Panel. The user can manually override the current values in specific ranges.

5. Workspace Analysis can be carried out using the Workspace Analysis Panel located in the middle left section of the GUI. The limits of evaluation are read from the current Workspace Size.The limits can be varied manually or alternatively by clicking on the specific radio button located above the specific workspace button for appropriate limits which have been decided to limit the time of solution. The manipulator has been simulated during workspace evaluation in order to determine the progress of evaluation. Only the final result is what should be considered as the workspace.

6. Path Tracking Analysis can be carried out using the Path Tracking Panel located in the bottom left corner of the GUI. The user can select either the desired phie or desired phiedot value. As soon the user will click on one of the values the other will be set to zero. The gain value is automatically update based on the type of control selected for best tracking performance considering the numerical solutions for Forward Kinematics. However, the user can manually override the values to check how the program behaves for different values. Path, type of control and simualtion time are other parameters that the user can vary.

7. The grid, scale and nomenclature can be turned on and off using the checkboxes provided at the top of the manipulator display window.

8. Clear button just clears the manipulator display window without affecting its pose. However, in case of a failure which occurs sometimes in numerical solution of the forward kinematics, Reset button is the last resort.



