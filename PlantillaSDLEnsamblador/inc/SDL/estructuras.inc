;ESTRUCTURAS SDL
SDL_JoystickID typedef DWORD
SDL_FingerID typedef QWORD
SDL_TouchID typedef QWORD
SDL_GestureID typedef QWORD
SDL_CommonEvent struct
    type_ DWORD		?
    timestamp DWORD ?   
SDL_CommonEvent ends

SDL_DisplayEvent struct
    type_ DWORD ?        
    timestamp DWORD ?   
    display DWORD ?    
    event BYTE ?        
    padding1 BYTE ?
    padding2 BYTE ?
    padding3 BYTE ?
    data1 SDWORD ?      
SDL_DisplayEvent ends

SDL_WindowEvent struct
    type_ DWORD ?      
    timestamp DWORD ?   
    windowID DWORD ?   
    event BYTE ?        
    padding1 BYTE ?
    padding2 BYTE ?
    padding3 BYTE ?
    data1 SDWORD ?        
    data2 SDWORD ?      
SDL_WindowEvent ends

SDL_KeySys struct
    scancode DWORD ?   
    sym      DWORD ?            
    mod_ WORD ?           
    unused DWORD ?
SDL_KeySys ends

SDL_KeyboardEvent struct
    type_ DWORD ?        
    timestamp DWORD ?  
    windowID DWORD ?  
    state BYTE ?      
    repeat_ BYTE ?      
    padding2 BYTE ?
    padding3 BYTE ?
    keysym SDL_KeySys <>
SDL_KeyboardEvent ends

SDL_TextEditingEvent struct
    type_ DWORD ?                                
    timestamp DWORD ?                           
    windowID DWORD ?                            
    text byte 32 dup (?)  
    start SDWORD ?                               
    length_ SDWORD ?                              
SDL_TextEditingEvent ends

SDL_TextInputEvent struct
    type_ DWORD ?                              
    timestamp DWORD ?                         
    windowID DWORD ?                          
    text byte 32 dup (?) 
SDL_TextInputEvent ends

SDL_MouseMotionEvent struct
    type_ DWORD ?        
    timestamp DWORD ?   
    windowID DWORD ?    
    which DWORD ?       
    state DWORD ?       
    x SDWORD ?           
    y SDWORD ?           
    xrel SDWORD ?        
    yrel SDWORD ?        
SDL_MouseMotionEvent ends

SDL_MouseButtonEvent struct
    type_ DWORD ?        
    timestamp DWORD ?   
    windowID DWORD ?    
    which DWORD ?       
    button BYTE ?       
    state BYTE ?        
    clicks BYTE ?       
    padding1 BYTE ?
    x SDWORD ?           
    y SDWORD ?           
SDL_MouseButtonEvent ends

SDL_MouseWheelEvent struct
    type_ DWORD ?        
    timestamp DWORD ?   
    windowID DWORD ?    
    which DWORD ?       
    x SDWORD ?           
    y SDWORD ?           
    direction DWORD ?   
SDL_MouseWheelEvent ends

SDL_JoyAxisEvent struct
    type_ DWORD ?        
    timestamp DWORD ?   
    which SDL_JoystickID ? 
    axis BYTE ?         
    padding1 BYTE ?
    padding2 BYTE ?
    padding3 BYTE ?
    value SWORD ?       
    padding4 WORD ?
SDL_JoyAxisEvent ends

SDL_JoyBallEvent struct
    type_ DWORD ?        
    timestamp DWORD ?   
    which SDL_JoystickID ? 
    ball BYTE ?         
    padding1 BYTE ?
    padding2 BYTE ?
    padding3 BYTE ?
    xrel SWORD ?        
    yrel SWORD ?        
SDL_JoyBallEvent ends

SDL_JoyHatEvent struct
    type_ DWORD ?        
    timestamp DWORD ?   
    which SDL_JoystickID ? 
    hat BYTE ?          
    value BYTE ?        
    padding1 BYTE ?
    padding2 BYTE ?
SDL_JoyHatEvent ends

SDL_JoyButtonEvent struct
    type_ DWORD ?        
    timestamp DWORD ?   
    which SDL_JoystickID ? 
    button BYTE ?       
    state BYTE ?        
    padding1 BYTE ?
    padding2 BYTE ?
SDL_JoyButtonEvent ends

SDL_JoyDeviceEvent struct
    type_ DWORD ?        
    timestamp DWORD ?   
    which SDWORD ?       
SDL_JoyDeviceEvent ends

SDL_ControllerAxisEvent struct
    type_ DWORD ?        
    timestamp DWORD ?   
    which SDL_JoystickID ? 
    axis BYTE ?         
    padding1 BYTE ?
    padding2 BYTE ?
    padding3 BYTE ?
    value SWORD ?       
    padding4 WORD ?
SDL_ControllerAxisEvent ends

SDL_ControllerButtonEvent struct
    type_ DWORD ?        
    timestamp DWORD ?   
    which SDL_JoystickID ? 
    button BYTE ?       
    state BYTE ?        
    padding1 BYTE ?
    padding2 BYTE ?
SDL_ControllerButtonEvent ends

SDL_ControllerDeviceEvent struct
    type_ DWORD ?        
    timestamp DWORD ?   
    which SDWORD ?       
SDL_ControllerDeviceEvent ends

SDL_ControllerTouchpadEvent struct
    type_ DWORD ?        
    timestamp DWORD ?   
    which SDL_JoystickID ? 
    touchpad SDWORD ?    
    finger SDWORD ?      
    x REAL4 ?            
    y REAL4 ?            
    pressure REAL4 ?     
SDL_ControllerTouchpadEvent ends

SDL_ControllerSensorEvent struct
    type_ DWORD ?        
    timestamp DWORD ?   
    which SDL_JoystickID ? 
    sensor SDWORD ?
    data real4 3 dup (?)         
SDL_ControllerSensorEvent ends

SDL_AudioDeviceEvent struct
    type_ DWORD ?        
    timestamp DWORD ?   
    which DWORD ?       
    iscapture BYTE ?    
    padding1 BYTE ?
    padding2 BYTE ?
    padding3 BYTE ?
SDL_AudioDeviceEvent ends

SDL_TouchFingerEvent struct
    type_ DWORD ?        
    timestamp DWORD ?   
    touchId SDL_TouchID ? 
    fingerId SDL_FingerID ?
    x REAL4 ?            
    y REAL4 ?            
    dx_ REAL4 ?           
    dy REAL4 ?           
    pressure REAL4 ?     
    windowID DWORD ?    
SDL_TouchFingerEvent ends

SDL_MultiGestureEvent struct
    type_ DWORD ?        
    timestamp DWORD ?   
    touchId SDL_TouchID ? 
    dTheta REAL4 ?
    dDist REAL4 ?
    x REAL4 ?
    y REAL4 ?
    numFingers WORD ?
    padding WORD ?
SDL_MultiGestureEvent ends

SDL_DollarGestureEvent struct
    type_ DWORD ?        
    timestamp DWORD ?   
    touchId SDL_TouchID ? 
    gestureId SDL_GestureID ?
    numFingers DWORD ?
    error REAL4 ?
    x REAL4 ?            
    y REAL4 ?            
SDL_DollarGestureEvent ends

SDL_DropEvent struct
    type_ DWORD ?        
    timestamp DWORD ?   
    file DWORD ?        
    windowID DWORD ?    
SDL_DropEvent ends

SDL_SensorEvent struct
    type_ DWORD ?        
    timestamp DWORD ?   
    which SDWORD ?       
    REAL4 data[6];      
SDL_SensorEvent ends

SDL_QuitEvent struct
    type_ DWORD ?        
    timestamp DWORD ?   
SDL_QuitEvent ends

SDL_OSEvent struct
    type_ DWORD ?        
    timestamp DWORD ?   
SDL_OSEvent ends

SDL_UserEvent struct
    type_ DWORD ?        
    timestamp DWORD ?   
    windowID DWORD ?    
    code SDWORD ?        
    data1 DWORD ?        
    data2 DWORD ?        
SDL_UserEvent ends

SDL_SysWMEvent struct
    type_ DWORD ?        
    timestamp DWORD ?   
    msg DWORD ?  
SDL_SysWMEvent ends

SDL_Event	union 
	type_		DWORD						?
	common		SDL_CommonEvent				<>
	display		SDL_DisplayEvent			<>
	window		SDL_WindowEvent				<>
	key			SDL_KeyboardEvent			<>
	edit		SDL_TextEditingEvent		<>
	text		SDL_TextInputEvent			<>
	motion		SDL_MouseMotionEvent		<>
	button		SDL_MouseButtonEvent		<>
	wheel		SDL_MouseWheelEvent			<>
	jaxis		SDL_JoyAxisEvent			<>
	jball		SDL_JoyBallEvent			<>
	jhat		SDL_JoyHatEvent				<>
	jbutton		SDL_JoyButtonEvent			<>
	jdevice		SDL_JoyDeviceEvent			<>
	caxis		SDL_ControllerAxisEvent		<>
	cbutton		SDL_ControllerButtonEvent	<>
	cdevice		SDL_ControllerDeviceEvent	<>
	ctouchpad	SDL_ControllerTouchpadEvent	<>
	csensor		SDL_ControllerSensorEvent	<>
	adevice		SDL_AudioDeviceEvent		<>
	sensor		SDL_SensorEvent				<>
	quit		SDL_QuitEvent				<>
	user		SDL_UserEvent				<>
	syswm		SDL_SysWMEvent				<>
	tfinger		SDL_TouchFingerEvent		<>
	mgesture	SDL_MultiGestureEvent		<>
	dgesture	SDL_DollarGestureEvent		<>
	drop		SDL_DropEvent				<>
	padding		byte						56 dup (?)
SDL_Event	ends

SDL_Color struct
    r byte ?
    g byte ?
    b byte ?
    a byte ?
SDL_Color ends

SDL_Rect struct
    x DWORD ?
    y DWORD ?
    w DWORD ?
    h DWORD ?
SDL_Rect ends