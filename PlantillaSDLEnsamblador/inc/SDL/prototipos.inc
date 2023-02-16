; PROTOTIPOS
SDL_Init						proto c :dword
SDL_NumJoysticks				proto c
SDL_JoystickOpen				proto c :dword
SDL_FreeSurface					proto c :dword
SDL_RWFromFile					proto c :dword, :dword
SDL_CreateWindow				proto c :dword, :dword, :dword, :dword, :dword, :dword
SDL_CreateRenderer				proto c :dword, :dword, :dword
SDL_SetRenderDrawColor			proto c :dword, :byte, :byte, :byte, :byte
SDL_GetWindowSurface			proto c :dword
SDL_UpdateWindowSurface			proto c :dword
SDL_CreateTextureFromSurface	proto c :dword, :dword
SDL_RenderClear					proto c :dword
SDL_RenderCopy					proto c :dword, :dword, :dword, :dword
SDL_RenderCopyEx				proto c :dword, :dword, :dword, :dword, :real8, :dword, :dword
SDL_RenderPresent				proto c :dword
SDL_PollEvent					proto c :dword
SDL_DestroyRenderer             proto c :dword
SDL_DestroyWindow               proto c :dword
SDL_JoystickClose               proto c :dword
SDL_DestroyTexture              proto c :dword
SDL_SetTextureColorMod          proto c :dword, :byte, :byte, :byte
SDL_GetError                    proto c
SDL_Quit                        proto c


IMG_Init						proto c :dword
IMG_Load						proto c :dword
IMG_Quit                        proto c

TTF_Init						proto c
TTF_OpenFont					proto c :dword, :dword
TTF_CloseFont                   proto c :dword
TTF_RenderText_Blended_Wrapped  proto c :dword, :dword, :SDL_Color, :dword
TTF_Quit                        proto c

Mix_OpenAudio					proto c :dword, :word, :dword, :dword
Mix_LoadWAV_RW					proto c :dword, :dword
Mix_LoadMUS						proto c :dword
Mix_FreeMusic                   proto c :dword
Mix_FreeChunk                   proto c :dword
Mix_PlayMusic                   proto c :dword, :dword
Mix_PauseMusic                  proto c
Mix_PlayChannelTimed            proto c :dword, :dword, :dword, :dword
Mix_Playing                     proto c :dword
Mix_Quit                        proto c